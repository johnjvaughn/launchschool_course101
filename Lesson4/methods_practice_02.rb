puts <<-QA
Q. How does count treat the block's return value? How can we find out?

A. It counts the number of times the block returns truthy,
   according to the ruby-doc.org docs.

QA

result = ['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

p result

