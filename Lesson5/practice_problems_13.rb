arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
p arr

# newarr = arr.sort do |a, b|
#   c = a.select { |n| n.odd? }
#   d = b.select { |n| n.odd? }
#   c <=> d
# end

# or
newarr = arr.sort_by { |subarr| subarr.select(&:odd?) }
p newarr
