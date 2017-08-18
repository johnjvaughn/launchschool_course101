puts <<-QA
Q. What is the return value of the select method below? Why?

A. It will return the array [1, 2, 3] since each iteration evaluates
   truthy due to the 'hi' insertion

QA

return_value = [1, 2, 3].select do |num|
  num > 5
  'hi'
end

p return_value

