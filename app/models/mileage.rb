class Mileage < ActiveRecord::Base

  belongs_to :user

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :date, date: true

end
