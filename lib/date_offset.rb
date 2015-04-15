
class DateOffset

  def self.generate(date)
    numeric_date_squared = date.to_i**2
    numeric_date_squared.to_s[-4..-1].chars.map(&:to_i)
  end
end

# @today = Date.today.strftime('%d%m%y')
# p DateOffset.generate(@today)
