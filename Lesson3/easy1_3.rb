puts "Replace the word \"important\" with \"urgent\" in this string:"
puts

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice

advice.gsub!('important', 'urgent')
puts advice