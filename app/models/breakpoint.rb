class Breakpoint < ActiveRecord::Base

  belongs_to :project

  validates :amount,        presence: true,
                            numericality: {
                              only_integer: true,
                              greater_than: 0
                            }

  validates :description,   presence: true

end
