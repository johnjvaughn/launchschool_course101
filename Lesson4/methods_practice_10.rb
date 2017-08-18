puts <<-QA
Q. What is the block's return value in the following code? Why?

A. It will return 1 on the first cycle, and then nil thereafter.
   The puts statement will make the block return nil whenever
   it is invoked in this spot, and that's anytime num is more than
   1.

QA

return_val = [1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
p return_val