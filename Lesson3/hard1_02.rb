puts <<-QA
Q. What is the result of the last line in the code below?

A. {:a => 'hi'}

CORRECTION: {:a => 'hi there'}
because informal_greeting = greetings[:a]
is an assignment by reference, as all assignments of the form
a = b
(where a and b are both variables) are.  
To make informal_greeting a separate object, use
informal_greeting = greetings[:a].clone;  informal_greeting << ' there'
or
informal_greeting = greetings[:a];        informal_greeting += ' there'

QA

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings