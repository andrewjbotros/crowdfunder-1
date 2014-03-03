class Breakpoint < ActiveRecord::Base

  belongs_to :project

  has_many :pledges
  has_many :backers, through: :pledges, source: 'user'

  validates :amount,        presence: true,
                            numericality: {
                              only_integer: true,
                              greater_than_or_equal_to: 0,
                              less_than_or_equal_to: -> (b) { b.project.goal}
                            }

  validates :description,   presence: true


  def total_pledged
    amount * pledges.count
  end

end
