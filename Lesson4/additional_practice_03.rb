ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages

ages.reject! { |_,age| age >= 100 }
p ages
