arr = [
  { a: [1, 2, 3] },
  { b: [2, 4, 6], c: [3, 6], d: [4] },
  { e: [8], f: [6, 10] }
]
p arr

newarr = arr.select do |hsh|
  hsh.all? do |_, arr2|
    arr2.all?(&:even?)
  end
end
p newarr
