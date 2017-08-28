NUM_LIGHTS = 1000

def toggle_lights(lights, multiples_of)
  lights.map!.with_index do |light, index| 
    index % multiples_of == 0 ? !light : light
  end
end

def output_lights_status(lights)
  lights.select.with_index {|light, index| !light }
  on_lights = []
  off_lights = []
  1.upto(NUM_LIGHTS) do |index|
    if lights[index]
      on_lights << index
    else
      off_lights << index
    end
  end
  puts "Lights #{off_lights.join(', ')} are now off."
  puts "Lights #{on_lights.join(', ')} are now on."
end

lights = Array.new(NUM_LIGHTS + 1, false)

1.upto(NUM_LIGHTS) do |number|
  toggle_lights(lights, number)
end

1.upto(NUM_LIGHTS) do |index| 
  puts "Light #{index} is on" if lights[index]
end

output_lights_status(lights)

puts <<-QA

Every 'on' number is a perfect square because those are numbers with an odd number
number of factors. For instance 16 has factors 1, 2, 4, 8, and 16. Starting from an
off state, its light will be toggled 5 times (once for each factor). So it will end
in an 'on' state.
All other numbers have an even number of factors, so their lights are toggled an 
even number of times, ending in an 'off' state.

QA


