def select_fruit(produce)
  fruit_only = {}
  produce_keys = produce.keys
  counter =0
  loop do
    key = produce_keys[counter]
    fruit_only[key] = produce[key] if produce[key] == 'Fruit'
    counter += 1
    break if counter >= produce_keys.size
  end
  fruit_only
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
