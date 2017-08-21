VOWELS = 'aeiou'

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
p hsh

hsh.each do |_,word_array|
  word_array.join.chars.each do |char|
    puts char if VOWELS.include?(char)
  end
end
