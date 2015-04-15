class Key

  def self.generate

    key = ''

    5.times { key << rand(9).to_s }

    key.chars.each_cons(2).map do |values|
      values.join.to_i
    end
  end
end


#p Key.generate

