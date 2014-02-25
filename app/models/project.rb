class Project < ActiveRecord::Base

  belongs_to :user

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
      # msg
    elsif !current_date?
      # msg
    elsif !near_future?
      # msg
    end
  end

  def verify_finish_date
    if finish_date.blank?
      # msg
    elsif !after_start_date?

    elsif !project_max_length?

    end
  end

  def current_date?
  end

  def near_future?
  end

  def after_start_date?
  end

  def project_max_length?
  end

end
