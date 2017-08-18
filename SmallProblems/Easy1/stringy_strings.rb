def stringy(number)
  binary_string = ''
  number.to_i.times do |i|
    binary_string += i.even? ? '1' : '0' 
  end
  binary_string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(8) == '01010101'