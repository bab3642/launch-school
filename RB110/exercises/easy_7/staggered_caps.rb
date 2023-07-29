def staggered_case(string, charcase = true)
  new_string = ''
  switch = true
  if charcase
    string.each_char do |character|
      if switch && character =~ /[a-z]/i
        new_string << character.upcase
        switch = !switch
      elsif !switch && character =~ /[a-z]/i
        new_string << character.downcase
        switch = !switch
      else
        new_string << character
      end
    end
  else
    string.each_char do |character|
      if switch
        new_string << character.upcase
      elsif !switch
        new_string << character.downcase
      end
      switch = !switch
    end
  end
  new_string
end

# return a NEW string

p staggered_case('I Love Launch School!') # == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'