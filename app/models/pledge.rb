class Pledge < ActiveRecord::Base

  belongs_to :user
  belongs_to :breakpoint

  validates :amount,        presence: true,
                            numericality: {
                              only_integer: true,
                              greater_than: 0,
                              greater_than_or_equal_to: :breakpoint_amount,
                            }

  validates :breakpoint_id, presence: true

  before_validation :set_amount

  def breakpoint_amount
    breakpoint.amount
  end

  def set_amount
    self.amount = breakpoint.amount
  end

end