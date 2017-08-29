SET_OF_BLOCKS = { 'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P', 'N' => 'A', 
                  'G' => 'T', 'R' => 'E', 'F' => 'S', 'J' => 'W', 'H' => 'U', 
                  'V' => 'I', 'L' => 'Y', 'Z' => 'M', 'U' => 'X' }

def block_word?(word)
  block_set = SET_OF_BLOCKS.to_a
  word.upcase.chars.each do |letter|
    found_block = nil
    block_set.each_with_index do |block, index|
      if block.include?(letter)
        found_block = index
        break
      end
    end
    if found_block
      block_set.delete_at(found_block)
    else
      return false
    end
  end
  true
end

puts block_word?('BATCH')
puts block_word?('BUTCH')
puts block_word?('jest')