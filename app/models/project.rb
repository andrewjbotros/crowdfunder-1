class Project < ActiveRecord::Base

  belongs_to :owner, class_name: 'user'

  has_many :breakpoints, dependent: :destroy
  # accepts_nested_attributes_for :breakpoints

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
    elsif !current_date?
      errors[:start_date] << "must be present"
    elsif !near_future?
      errors[:start_date] << "is too far away from now (within 30 days)"
    end
  end

  def verify_finish_date
    if finish_date.blank?
      errors[:finish_date] << "can't be blank"
    elsif !after_start_date?
      errors[:finish_date] << "must be after start date"
    elsif !project_max_length?
      errors[:finish_date] << "can't be longer than 90 days"
    end
  end

  def current_date?(date)
    date.today?
  end

  def near_future?
  end

  def after_start_date?
  end

  def project_max_length?
  end

end
