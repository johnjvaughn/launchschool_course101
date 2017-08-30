NOUNS = %w(cat tree car building computer house)
VERBS = %w(purrs grows drives stands runs explodes)
ADJECTIVES = %w(furry brown fast stately technological dilapidated)
ADVERBS = %w(quietly beautifully shiningly forever smartly fittingly)

DEFAULT_TEXT = "madlib.txt"
TEXT_FILE = ARGV[0] || DEFAULT_TEXT

def madlib
  madlib_text = IO.read(TEXT_FILE)
  madlib_array = madlib_text.split
  madlib_array.map! do |word|
    case 
    when word.include?('NOUN')
      word.gsub('NOUN', NOUNS.sample)
    when word.include?('ADJECTIVE')
      word.gsub('ADJECTIVE', ADJECTIVES.sample)
    when word.include?('ADVERB')
      word.gsub('ADVERB', ADVERBS.sample)
    when word.include?('VERB')
      word.gsub('VERB', VERBS.sample)
    else
      word
    end
  end
  madlib_array.join(' ')
end

def madlib_ls
  File.open('madlib_ls.txt') do |file|
    file.each do |line|
      puts format(line, noun:      NOUNS.sample,
                        verb:      VERBS.sample,
                        adjective: ADJECTIVES.sample,
                        adverb:    ADVERBS.sample)
    end
  end
end

puts madlib
puts
madlib_ls

