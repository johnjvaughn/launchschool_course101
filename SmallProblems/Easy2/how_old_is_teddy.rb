puts "Please enter a name:"
name = gets.chomp
if name.empty?
  name = 'Teddy'
end
age = rand(20..200)
puts "#{name} is #{age} years old!"