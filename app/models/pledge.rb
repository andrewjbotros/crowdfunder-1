class Pledge < ActiveRecord::Base

  belongs_to :user
  belongs_to :breakpoint

  validates :amount,      presence: true,
                          numericality: {
                            only_integer: true,
                            greater_than: 0
                          }

end