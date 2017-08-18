def digit_list(number)
  return nil unless number.to_i > 0
  num_array = []
  number.to_s.split('').each { |digit_str| num_array << digit_str.to_i }
  num_array
end

def digit_list_better(number)
  return nil unless number.to_i > 0
  number.to_s.chars.map(&:to_i)
end

numbers = [12345, 7, 375290, 444, -1, 'fake']
numbers.each { |num| puts "#{num}: #{digit_list_better(num)}" }
