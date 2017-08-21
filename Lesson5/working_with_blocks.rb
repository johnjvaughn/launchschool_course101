# Example 3

ret_val = [[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
p ret_val
# 1
# 3
# => [1, 3]

# line  Action              Object            Side Effect   Return Value          Is Return Value Used?
# 1     method call (map)   The outer array   None          New array [1, 3]      No, but shown (and assigned to ret_val above)
# 1-4   block execution     Each sub-array    None          Element at index 0    Yes, used by map for transformation
#                                                           of sub-array                   
# 2     method call (first) Each sub-array    None          Element at index 0    Yes, used by puts
#                                                           of sub-array 
# 2     method call (puts)  Element at index  Output string nil                   No
#                           0 of each sub-array
# 3     method call (first) Each sub-array    None          Element at index 0    Yes, used to determine return value of block
#                                                           of sub-array 

# Example 4

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
p my_arr

# line  Action              Object                  Side Effect   Return Value          Is Return Value Used?
# 1     var assignment      n/a                     None          new value of var      No (given to p, above)
# 1     method call(each)   Outer array             None          Calling object        Yes, assigned to my_arr
# 1-7   block exec (outer)  Each sub-array          None          sub-array             No
# 2     method call(each)   Each sub-array          None          Calling Object        Yes, used to determine return val of outer block
# 2-6   block exec (inner)  Each element of sub-arr None          nil                   No
# 3     comparison (>)      Each element of sub-arr None          true or false         Yes, by if
# 3     conditional (if)    Each element of sub-arr None          nil                   Yes, used to determine return val of inner block
# 4     method call(puts)   Each element within     Output string nil                   Yes, used to determine return val of inner block
#                           sub-array that satisfies
#                           condition (i.e. > 5)

# Example 5

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# line  Action              Object                  Side Effect   Return Value          Is Return Value Used?
# 1     method call(map)    Outer array             None          New array [[2,4], [6,8]]     No
# 1-5   block exec (outer)  Each sub-array          None          New sub-array with    Yes, used by outer map method to fill its return array
#                                                                 each element doubled  
# 2     method call(map)    Each sub-array          None          New sub-array with    Yes, used to determine return val of outer block
#                                                                 each element doubled
# 2-4   block exec (inner)  Each element of sub-arr None          Each element doubled  Yes, used by inner map method to fill its return array
# 3     multiplication      n/a                     None          product of multipl.   Yes, used by inner block as return value

# Example 6

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

# line  Action              Object                  Side Effect   Return Value          Is Return Value Used?
# 1     method call(select) Outer array             None          New selected array    No but shown
# 1-5   block exec (outer)  Each hash in the array  None          true or false passed  Yes, used by select to construct return array
#                                                                 from hash.all?
# 2     method call(all?)   Each hash               None          Boolean               Yes, used as return val of outer block
# 2-4   block exec (inner)  Each key/val in hash    None          Boolean               Yes, used by all? to return a Boolean
# 3     comparison (==)     n/a                     None          Boolean               Yes, used as return val of inner block
# 3     string reference([]) value (string) of each hash  None    String of length 1    Yes, in comparison
# 3     method call(to_s)   key (symbol) of each hash     None    String                Yes, in comparison

puts <<-QA
Example 6
Q. What would happen if, instead of using all?, we used any?. Why would this affect the return value of select?

A. any? would return true for both hashes in the outer array since both have at least one key/value pair that
   satisfies the comparison.  So select would return an array equal to the original array.
QA

# Example 7

arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end

puts <<-QA
Example 7
Q. So what is happening here?

A. The .map method is converting each inner array to integer elements. These new arrays of integers are then
   compared with .sort_by to determine the ordering of the sub-arrays within the outer array.

QA

# Example 8

[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]

puts <<-QA
Example 8
Here map is used to map the outer array to a transformed outer array consisting of sub-arrays
whose elements have been filtered with the inner .select method.  If we wanted to make sure
there were no empty sub-arrays at the end, we could do another select method on the outer array
to remove the empty sub-arrays.

QA

# Example 9

[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|     # element1 is [[1],[2],[3],[4]] and then [['a'], ['b'], ['c']]
    element2.partition do |element3|    #element2 is [1], [2], [3] etc.
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]

puts <<-QA
Example 9
The .each method on line 2 always returns the calling object unmodified. So nothing within that
block matters, except for side effects. There are no side effects (no mutations or output) so
the .map ultimately just returns a new array equal to the original.

QA

# Example 10

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

puts <<-QA
Example 10
Q. Work on breaking down each component and understanding the return value of each expression. 
   What will be the final return value?

A. This should return:
   [[[2, 3], [4, 5]], [6, 7]]
   The lowest (3rd) level .map method assumes each element will be an integer, and simply adds 1 to it.
   A level above that (2nd level), that .map block first checks if its element is an integer or a sub-array.
   It transforms to either an incremented integer, or uses the 3rd level .map to transform to a sub-array of
   incremented integers.  Finally at the top level, the .map returns a top level of transformed sub-arrays.

QA

