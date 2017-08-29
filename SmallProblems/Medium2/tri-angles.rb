TRIANGLE_TYPES = [:right, :acute, :obtuse, :invalid]

def triangle(angle_A, angle_B, angle_C)
  angles = [angle_A, angle_B, angle_C]

  case 
  when angles.sum != 180 || angles.min <= 0
    :invalid
  when angles.include?(90)
    :right
  when angles.max > 90
    :obtuse
  else
    :acute
  end
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid