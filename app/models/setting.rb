class Setting < ActiveRecord::Base

  valid_name_entries = %w(STARTING_MONTH YEARLY_MILEAGE STARTING_MILEAGE)

  validates_inclusion_of :name, in: valid_name_entries
  validates :value, presence: true
  validate :is_value_a_valid_month? 

  private

  def is_value_a_valid_month?
    if name == 'STARTING_MONTH' && value.present? && !Date::MONTHNAMES.slice(1,12).inspect.include?(value) then
        errors.add(:value, "must be a month")   
    end
  end

end
