def rotate_array(arr)
  return [] if arr.empty?
  newarr = arr.clone
  newarr << newarr.shift
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_integer(num)
  num = num.abs.round
  rotate_string(num.to_s).to_i
end

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true

a_string = "Launch"
puts rotate_string(a_string) == "aunchL"
puts a_string == "Launch"

a_number = 8392
puts rotate_integer(a_number) == 3928
puts a_number == 8392