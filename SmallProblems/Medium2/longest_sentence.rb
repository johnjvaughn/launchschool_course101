DEFAULT_TEXT = "gettysburg.txt"
text_file = ARGV[0] || DEFAULT_TEXT

speech_text = IO.read(text_file)
speech_paragraphs = speech_text.split(/\n\n/)
longest_paragraph = speech_paragraphs.max_by { |paragraph| paragraph.split.size }
longest_paragraph.strip!

puts "Longest Paragraph:"
puts longest_paragraph
puts "(#{longest_paragraph.split.size} words)"
puts

speech_text.tr!("\n", " ")
speech_sentences = speech_text.split(/[.?!] /)
longest_sentence = speech_sentences.max_by { |sentence| sentence.split.size }
longest_sentence.strip!

puts "Longest Sentence:"
puts longest_sentence
puts "(#{longest_sentence.split.size} words)"
puts

speech_words = speech_text.tr(".,;-?!", "").split
longest_word = speech_words.max_by { |word| word.size }
puts "Longest Word: #{longest_word} (#{longest_word.size} letters)"

