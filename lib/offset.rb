
class Offset

  def self.total_offset(date_offset, key_rotations)
    date_offset.zip(key_rotations).map { |date, key_rotations| (date + key_rotations) % 39 }
  end
end


