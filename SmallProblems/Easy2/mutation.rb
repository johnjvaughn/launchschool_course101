puts <<-QA

Q. What will the following code print, and why?

A. I think it will print the original version of the array, with no capitalized words.
CORRECTION: I thought array2 would be filled with new elements, but actually it
is filled with the same references, so any changes to members of one will be
reflected in the other array.

QA

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2