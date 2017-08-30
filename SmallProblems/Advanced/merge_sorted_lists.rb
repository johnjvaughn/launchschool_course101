def merge(array1, array2)
  return array1 if array2.empty?
  return array2 if array1.empty?
  merged_array = []
  index1, index2 = 0, 0
  loop do
    if array1[index1] <= array2[index2]
      merged_array << array1[index1]
      index1 += 1
      if index1 >= array1.size
        merged_array += array2[index2..-1]
        break
      end
    else
      merged_array << array2[index2]
      index2 += 1
      if index2 >= array2.size 
        merged_array += array1[index1..-1]
        break
      end
    end
    break if index1 >= array1.size && index2 >= array2.size
  end
  merged_array
end

puts merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
puts merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
puts merge([], [1, 4, 5]) == [1, 4, 5]
puts merge([1, 4, 5], []) == [1, 4, 5]
