def is_an_ip_number?(input_string)
  (0..255).include?(input_string.to_i) # not a completed function, just something to use
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4 # added this test to make sure we have 4 parts
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word) # return false if we have an invalid part
  end
  true # no need to write 'return' here
end

test_ips = ['1.2.3.4', '258.32.14.100', '7.6.5', '0.1.3.5.9', 'a.b.3.3']
test_ips.each do |ip|
  puts "#{ip}: #{dot_separated_ip_address?(ip)}"
end