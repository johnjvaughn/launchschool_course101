def make_index_hash(some_array)
  hsh = {}
  some_array.each_with_index { |item, index| hsh[item] = index }
  hsh
end

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
p flintstones
p make_index_hash(flintstones)