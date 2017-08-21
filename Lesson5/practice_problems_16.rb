UUID_CHARS = ('0'..'9').to_a + ('a'..'f').to_a
UUID_SECTIONS = [8, 4, 4, 4, 12]

def generate_uuid
  uuid = ''
  UUID_SECTIONS.each_with_index do |section_length, index|
    section_length.times { uuid << UUID_CHARS.sample }
    uuid << '-' unless index == UUID_SECTIONS.size - 1
  end
  
  uuid
end

puts generate_uuid
