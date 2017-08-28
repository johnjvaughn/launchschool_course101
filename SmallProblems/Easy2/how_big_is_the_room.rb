SQ_FEET_PER_SQ_METER = 10.7639
SQ_INS_PER_SQ_FOOT = 144
SQ_CM_PER_SQ_METER = 10_000

puts "Enter room length in meters:"
length_m = gets.to_f
puts "Enter room width in meters:"
width_m = gets.to_f

area_ms = (length_m * width_m).round(2)
area_fts = (area_ms * SQ_FEET_PER_SQ_METER).round(2)
area_ins = area_fts * SQ_INS_PER_SQ_FOOT
area_cms = area_ms * SQ_CM_PER_SQ_METER
puts format "The area of the room is %0.2f square meters (%0.2f square feet).",
     area_ms, area_fts
puts format "That is %0.2f square inches or %0.2f square cm.", 
     area_ins, area_cms