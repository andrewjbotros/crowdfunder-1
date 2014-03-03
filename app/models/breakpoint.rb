class Breakpoint < ActiveRecord::Base

  belongs_to :project

  has_many :pledges
  has_many :backers, through: :pledges, source: 'user'

  validates :amount,        presence: true,
                            numericality: {
                              only_integer: true,
                              greater_than_or_equal_to: 0
                            }

  validates :description,   presence: true
  validate :valid_amount

  def total_pledged
    amount * pledges.count
  end

private

  def valid_amount
  	if amount > project.goal
      errors[:base] << "Breakpoint amount cannot be greater than the project goal"
    end
  end

end
