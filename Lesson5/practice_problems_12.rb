arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
p arr

hsh = {}
arr.each { |subarr| hsh[subarr[0]] = subarr[1] }
p hsh