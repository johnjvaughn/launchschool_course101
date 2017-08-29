def balanced?(str)
  return false unless str.count("'").even? && str.count('"').even?
  depth = { '()' => 0, '[]' => 0, '{}' => 0 }
  depth.each_key do |symbols|
    return false if str.count(symbols[0]) != str.count(symbols[1])
  end

  str.chars.each do |char|
    depth.each_key do |symbols|
      if char == symbols[0]
        depth[symbols] += 1
      elsif char == symbols[1]
        depth[symbols] -= 1
        return false if depth[symbols] < 0
      end
    end
  end
  true
end

puts balanced?('What [(is)] this?') == true
puts balanced?('What is} thi}s?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false