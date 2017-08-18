puts <<-QA
Q. What is the return value of each_with_object in the following code? Why?

A. Return value = { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }
   The each_with_object method will fill the given collection.
   In this case, a hash is built with the initial letter of each
   word as the key, and the whole word as corresponding value.

QA

result = ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

p result

