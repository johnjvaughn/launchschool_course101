def titleize(sentence)
  sentence.split.map(&:capitalize).join(' ')
end

words = "the flintstones rock"
p words
p titleize(words)
