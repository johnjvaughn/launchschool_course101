puts <<-ANS
A. The behavior in this version should all be the same. The 'times' block has been
replaced by a method; however the times block was really a method anyway.  

Correction: I learned that a method is not quite the same as a block, because of
variable scope.  The arguments to an_illustrative_method are named the same as the outer
vars, but this is just coincidence -- they don't have to be.  In exercise 1, the inner
block was actually using the original vars -- they are in the scope rather than passed in
as parameters. So here, non-destructive changes within the method (like the assignment
statements 'b_outer = "thirty three"' etc.) don't alter the variables outside the method.
If this had been 'b_outer << "thirty three"' I believe that var's value would have changed,
though it would still have the same object_id.

ANS

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the method."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the method."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the method."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the method.\n\n"

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  puts "A. The variables that were reassigned to new addresses inside the method should still be reassigned to different object_id's.\n\n"
  puts "A. CORRECTION: these variables reverted to their values and object_id's from before the method call.\n\n"

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method.\n\n"

  puts "A. The inner variables were initialized inside the method and so will not be accessible at all outside.\n\n"

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method.\n\n" rescue puts "ugh ohhhhh"
end

def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  a_outer_inner_id = a_outer.object_id
  b_outer_inner_id = b_outer.object_id
  c_outer_inner_id = c_outer.object_id
  d_outer_inner_id = d_outer.object_id

  puts "A. I think these IDs will be the same from outside to inside the method.\n\n"

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer_inner_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer_inner_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer_inner_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer_inner_id} inside the method.\n\n"

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "A. The reassignment statements should change all of the object_id's.\n\n"

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"


  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "A. These assignments just point these *_inner vars to *_outer vars, so the object_id's should not change.\n\n"

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer).\n\n"
end


fun_with_ids