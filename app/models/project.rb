class Project < ActiveRecord::Base

  belongs_to :owner, class_name: "User", foreign_key: "user_id"

  has_many :breakpoints, dependent: :destroy
  accepts_nested_attributes_for :breakpoints

  has_many :taggings
  has_many :tags, through: :taggings

  has_many :pledges, through: :breakpoints

  has_many :backers, through: :pledges, source: 'user'

  has_many :comments, as: :commentable

  validates :name,          presence: true

  validates :description,   presence: true

  validates :goal,          presence: true,
                            numericality: {
                              only_integer: true,
                              greater_than: 0
                            }

  validate  :verify_start_date, on: :create
  validate  :verify_finish_date, on: :create

  scope :active,    -> { where("start_date < ? AND finish_date > ?", Time.now, Time.now) }
  scope :expired,  -> { where("finish_date < ?", Time.now) }

  def funded?
    percent_complete >= 100 ? true : false
  end

  def has_backers?
    !backers.empty?
  end

  def backer?(user)
    backers.exists?(id: user.id)
  end

  def which_pledge(user)
    pledges.find_by(user_id: user.id)
  end

  def owner?(user)
    owner == user
  end

  def total_pledged
    pledges.inject(0) { |sum, p| sum + p.amount }
  end

  def remaining_time
    hours = remaining_hours
    if hours < 0
      return "Expired"
    elsif hours > 24
      return sprintf("%.0f", hours / 24) << " day".pluralize((hours / 24).to_i) << " left"
    else
      return sprintf("%.0f", hours) << " hour".pluralize(hours) << " left"
    end
  end

  def remaining_days
    if remaining_hours < 0
      return "0"
    else
      return (remaining_hours / 24).round(1)
    end
  end

  def remaining_hours
    starting_date = Time.now.utc > start_date ? Time.now.utc : start_date
    hours = (finish_date.end_of_day - starting_date) / 3600
  end

  def percent_complete
    ((total_pledged.to_f / goal.to_f) * 100).to_i
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(", ").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def self.tagged_with(name)
    Tag.where(:name => name).take!.projects
  end

  def self.tag_counts
    Tag.select("tags.id, tags.name, count(taggings.tag_id) as count").
    joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end

private

  def verify_start_date
    if start_date.blank?
      errors[:start_date] << "can't be blank"
    elsif  !within_timeframe?(start_date, Date.today, 29)
      errors[:start_date] << "must be within 30 days from today"
    end
  end

  def verify_finish_date
    if finish_date.blank?
      errors[:finish_date] << "can't be blank"
    elsif !within_timeframe?(finish_date, start_date, 89)
      errors[:finish_date] << "must be within 90 days from the starting date (#{start_date.to_date})"
    end
  end

  def within_timeframe?(chosen_date, starting_date, number_of_days)
    chosen_date.to_date.between?(starting_date.to_date, starting_date + number_of_days.day)
  end

end
