def get_grade(score1, score2, score3)
  mean = (score1 + score2 + score3) / 3
  case 
  when mean >= 90 then 'A'
  when mean < 90 && mean >= 80 then 'B'
  when mean < 80 && mean >= 70 then 'C'
  when mean < 70 && mean >= 60 then 'D'
  else                            'F'
  end
end

p  (95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"