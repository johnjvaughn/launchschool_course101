puts <<-QA
Q. What does shift do in the following code? How can we find out?

A. According to Hash#shift page at ruby-doc.org, it removes the first
   key/value pair from the hash (mutating it) and returns the removed
   pair as a 2-item array.  So here it will return [:a, 'ant'] while
   leaving hash with just { b: 'bear' }

QA

hash = { a: 'ant', b: 'bear' }
p hash.shift
p hash
