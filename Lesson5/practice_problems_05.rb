munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

p munsters
puts
age_sum = 0
munsters.each_value do |info|
  age_sum += info['age'] if info['gender'] == 'male'
end
puts "The ages of the male members sum to #{age_sum}."
