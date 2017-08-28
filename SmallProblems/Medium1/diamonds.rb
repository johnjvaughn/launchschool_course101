def diamond(dimension)
  dimension.times do |index|
    if index <= dimension / 2
      num_stars = 2 * index + 1
    else
      num_stars = 2 * (dimension - index) - 1
    end
    puts ("*" * num_stars).center(dimension)
  end
end

def diamond_outline(dimension)
  dimension.times do |index|
    if index <= dimension / 2
      num_stars = 2 * index + 1
    else
      num_stars = 2 * (dimension - index) - 1
    end
    output = "*"
    if num_stars > 1
      output << " " * (num_stars - 2)
      output << "*"
    end
    puts output.center(dimension)
  end
end

diamond(3)
diamond(1)
diamond(9)
diamond(7)
diamond_outline(3)
diamond_outline(1)
diamond_outline(9)
diamond_outline(7)