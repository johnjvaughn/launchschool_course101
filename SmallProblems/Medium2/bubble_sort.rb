def swap!(arr, i1, i2)
  arr[i1], arr[i2] = arr[i2], arr[i1]
end

def bubble_sort!(arr)
  n = arr.size - 1
  loop do
    swapped = false
    n.times do |index|
      if arr[index] > arr[index + 1]
        swap!(arr, index, index + 1)
        swapped = true
      end
    end
    break unless swapped
    n -= 1
    break if n <= 0
  end
end

array = [5, 3]
p array
bubble_sort!(array)
p array

array = [6, 2, 7, 1, 4]
p array
bubble_sort!(array)
p array

array = [6, 2, 17, 1, 4, 29, 30, -2, -9, 101, 1]
p array
bubble_sort!(array)
p array

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p array
bubble_sort!(array)
p array
