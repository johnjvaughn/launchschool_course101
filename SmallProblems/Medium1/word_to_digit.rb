WORD_TO_NUMS = { 'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 
                 'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9 }

def word_to_digit(sentence)
  WORD_TO_NUMS.each do |word, num|
    sentence.gsub!(/\b#{word}\b/, num.to_s)
  end
  sentence.gsub!(/(\d) (\d)/, '\1\2') # remove spaces from between digits
  sentence.gsub!(/(\d) (\d)/, '\1\2') # intentionally twice
  sentence.gsub!(/\b(\d{3})(\d{3})(\d{4})\b/, '(\1) \2-\3') #format phone number
  sentence
end

sometext = 'Please call me at 303 five five five one two three four. Thanks.'
puts sometext
word_to_digit(sometext)
puts sometext
puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5551234. Thanks.'