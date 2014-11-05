class MileageCalculator

  def self.labels(starting_month)
    date_from  = Date.parse(starting_month)
    date_to    = date_from.to_time.advance(months: 11).to_date
    date_range = date_from..date_to

    date_months = date_range.map { |d| Date.new(d.year, d.month, 1) }.uniq
    date_months.map { |d| d.strftime '%B' }
  end

  def self.expected(yearly_milage, starting_milage)
    monthly_mileage = yearly_milage.to_i / 12
    current = starting_milage.to_i
    out = []

    12.times do
      current += monthly_mileage
      out << current
    end

    out
  end

  def self.actual(starting_month)
    mileages = Mileage.all.group_by { |m| m.date.end_of_month }
    total = Array.new(13, 0)

    mileages.each do |date, weeks|
      total[date.month.to_i] += weeks.last.amount
    end

    total.shift

    total = total.rotate(Date.parse(starting_month).strftime('%m').to_i - 1)
  end


end