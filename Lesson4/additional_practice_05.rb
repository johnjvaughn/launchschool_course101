flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles Bernard)
p flintstones

index = flintstones.index { |name| name[0,2] == 'Be' }
puts "Be first appears at index #{index}"

