def letter_percentages(str)
  count_hsh = { uppercase: 0, lowercase: 0, neither: 0 }
  count_hsh[:uppercase] = str.chars.count { |char| char =~ /[A-Z]/ }
  count_hsh[:lowercase] = str.chars.count { |char| char =~ /[a-z]/ }
  count_hsh[:neither] = str.size - count_hsh[:uppercase] - count_hsh[:lowercase]

  { lowercase: (100.0 * count_hsh[:lowercase] / str.size), 
    uppercase: (100.0 * count_hsh[:uppercase].to_f / str.size),
    neither:   (100.0 * count_hsh[:neither].to_f / str.size) }
end


puts letter_percentages('abCdef 123')
puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }