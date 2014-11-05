class Mileage < ActiveRecord::Base

  validates :amount, presence: true, numericality: true
  validates :date, date: true

end
