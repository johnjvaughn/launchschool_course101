ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages
age_sum = ages.values.sum
puts "Sum of all the ages is #{age_sum}"

# or
age_sum = 0
ages.each { |_,age| age_sum += age }
puts "Sum of all the ages is still #{age_sum}"
