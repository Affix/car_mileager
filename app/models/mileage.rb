class Mileage < ActiveRecord::Base

  belongs_to :user

  validates :amount, presence: true, numericality: true
  validates :date, date: true

end
