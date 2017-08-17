ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts "Hash [] method"
puts ages["Spot"] ? "Spot is present and equal to #{ages['Spot']}" : "Spot is not present."
puts "Hash#include? method"
puts ages.include?("Spot") ? "Spot is present and equal to #{ages['Spot']}" : "Spot is not present."
puts "Hash#member? method"
puts ages.member?("Spot") ? "Spot is present and equal to #{ages['Spot']}" : "Spot is not present."

