class Project < ActiveRecord::Base

  belongs_to :user

  has_many :breakpoints, dependent: :destroy
  accepts_nested_attributes_for :breakpoints

  has_many :pledges, through: :breakpoints

  validates :name,          presence: true

  validates :description,   presence: true

  validates :goal,          presence: true,
                            numericality: {
                              only_integer: true,
                              greater_than: 0
                            }

  validate  :verify_start_date
  validate  :verify_finish_date

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
