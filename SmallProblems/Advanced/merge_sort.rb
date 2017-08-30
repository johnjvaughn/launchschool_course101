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

def merge_sort(arr)
  return arr if arr.size == 1
  halfway = arr.size / 2
  sub_array1, sub_array2 = [arr[0..(halfway-1)], arr[halfway..-1]]
  sub_array1 = merge_sort(sub_array1)
  sub_array2 = merge_sort(sub_array2)
  merge(sub_array1, sub_array2)
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
