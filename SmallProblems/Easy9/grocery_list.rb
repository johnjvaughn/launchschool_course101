def buy_fruit(arr)
  new_arr = []
  arr.each do |fruit_arr|
    fruit = fruit_arr[0]
    number = fruit_arr[1]
    new_arr += [fruit] * number
  end
  new_arr
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
       ["apples", "apples", "apples", "orange", "bananas","bananas"]