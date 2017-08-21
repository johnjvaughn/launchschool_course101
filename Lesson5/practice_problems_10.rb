arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
p arr

newarr = arr.map do |hsh|
  newhsh = {}
  hsh.each { |key, value| newhsh[key] = value + 1 }
  newhsh
end

p newarr
