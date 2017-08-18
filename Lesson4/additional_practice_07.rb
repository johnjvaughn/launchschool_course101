statement = "The Flintstones Rock"
p statement
char_hash = {}

statement.chars.uniq.each do |char|
  char_hash[char] = statement.count(char) unless char == ' '
end

p char_hash