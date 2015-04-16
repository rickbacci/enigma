
class EncryptionKey

  def self.generate_key
    @key = ''
    5.times { @key << rand(9).to_s }
    return @key
  end

  def self.calculate_rotations(key)
    key.chars.each_cons(2).map do |values|
      values.join.to_i
    end
  end
end



