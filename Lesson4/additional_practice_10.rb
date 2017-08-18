munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

p munsters
puts

# munsters["Herman"]["age_group"] = "adult"
# p munsters

def get_age_group(age)
  case age
  when 0..17
    'kid'
  when 18..64
    'adult'
  else
    'senior'
  end
end

munsters.each do |name, info_hash| 
  munsters[name]["age_group"] = get_age_group(munsters[name]["age"])
  puts "#{name}:  #{info_hash}"
end

# p munsters
