require 'Date'

class MessageDate

  def self.generate_date
    @msg_date = Date.today.strftime('%d%m%y')
  end

  def self.calculate_offset(date)
    numeric_date_squared = date.to_i**2
    numeric_date_squared.to_s[-4..-1].chars.map(&:to_i)
  end

end


if __FILE__ == $0
p  MessageDate.generate_date
p  MessageDate.calculate_offset(MessageDate.generate_date)
end
