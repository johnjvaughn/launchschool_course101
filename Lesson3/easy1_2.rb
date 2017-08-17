puts <<-QA
Q: Describe the difference between ! and ? in Ruby.
   And explain what would happen in the following scenarios:

  what is != and where should you use it?
  A: != is a comparison operator meaning 'is not equal to',
     so the expressions (4 != 5) and ("a" != "aa") both evaluate to true

  put ! before something, like !user_name
  A: means 'not' in Boolean expressions; i.e. 'if !user_name' means 'if user_name is nil or false'

  put ! after something, like words.uniq!
  A: conventionally indicates a method that mutates (changes the referenced value of) the caller. 
     Not all mutating methods end in '!', but nearly
     all methods that end in '!' mutate the calling object; though this is just convention.

  put ? before something
  A: probably a ternary operator such as "num_type = (number % 2 == 0) ? 'even' : 'odd'"

  put ? after something
  A: conventially used in a method that returns a Boolean value, such as "str.start_with?('A')"
     which returns true if and only if str begins with 'A'

  put !! before something, like !!user_name
  A: a double-negation of that value, so this will return false if user_name is 
     nil or false, and will return true in all other cases
QA

