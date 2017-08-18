def count_occurrences(array_of_strings)
  count_hsh = {}
  array_of_strings.uniq.each do |word|
    count_hsh[word] = array_of_strings.count(word)
  end
  count_hsh
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

vehicle_hsh = count_occurrences(vehicles)

vehicle_hsh.each { |vehicle, count| puts "#{vehicle} => #{count}" }