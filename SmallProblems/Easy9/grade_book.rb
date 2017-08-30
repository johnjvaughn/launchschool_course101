SCORE_TO_GRADE = { 90 => 'A', 80 => 'B', 70 => 'C', 60 => 'D', 0 => 'F' }

def get_grade(score1, score2, score3)
  mean = (score1 + score2 + score3) / 3
  SCORE_TO_GRADE.each do |level, grade|
    return grade if mean > level
  end
  nil
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"