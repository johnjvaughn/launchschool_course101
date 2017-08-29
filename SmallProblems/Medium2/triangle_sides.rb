TRIANGLE_TYPES = [:equilateral, :isosceles, :scalene, :invalid]

def triangle (side_a, side_b, side_c)
  sides = [side_a, side_b, side_c].sort
  if sides[0] <= 0 || sides[0] + sides[1] < sides[2]
    :invalid
  elsif sides.max == sides.min
    :equilateral
  elsif sides[0] == sides[1] || sides[1] == sides[2]
    :isosceles
  else
    :scalene
  end
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid