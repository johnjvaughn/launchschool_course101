def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

puts <<-ANS
A. rolling_buffer1 uses 
buffer << new_element
which makes it a destructive method on 'buffer', which was an
argument to the method.

rolling_buffer2 instead uses assignment:
buffer = input_array + [new_element]
which is non-destructive (and 'buffer' is a local variable anyway)
so this method does not alter the contents of any of its arguments
but simply returns the new buffer
ANS