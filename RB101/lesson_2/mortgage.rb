# GET the loan amount
# GET the APR
# GET the loan duration

# calculate monthly interest rate (APR / 12)
# convert the loan duration to months (duration * 12)
# calculate the monthly payment
def prompt(message)
  puts "=> " + message
end

def valid_num?(num)
  num.to_i().to_s() == num || num.to_f().to_s() == num
end

def calculate_payment(p, j, n)
  p * (j / (1 - (1 + j)**(-n)))
end



prompt("Welcome to the Mortgage/Car Loan Calculator!")

loop do
  loan_amount = ''
  loop do
    prompt("Enter your loan amount:")
    loan_amount = gets().chomp() 
    
    if loan_amount == '0'
      prompt("Loan amount cannot equal 0")
    elsif loan_amount.to_f < 0
      prompt("Loan amount cannot be a negative number!")
    elsif valid_num?(loan_amount)
      break
    else
      prompt("Please enter a valid number")
    end
  end
  
  apr = ''
  loop do
    prompt("Enter your APR as whole percentage:")
    apr = gets().chomp() 
    
    if apr == '0'
      prompt("APR cannot equal 0")
    elsif apr.to_f < 1 && apr.to_f > 0
      prompt("Please make sure to enter APR as a WHOLE percentage (i.e. 26% would be 26, not .26)")
    elsif apr.to_f < 0
      prompt("APR cannot be negative")
    elsif valid_num?(apr)
      break
    else
      prompt("Please enter a valid number")
    end
  end
  
  loan_duration = ''
  timeframe = ''
  loop do
    loop do
      prompt("Is your loan term in years or months? (enter 'y' for year and 'm' for months)")
      timeframe = gets().chomp().downcase()
      
      case timeframe
      when 'y'
        prompt("How many years is the loan?")
        break
      when 'm'
        prompt("How many months is the loan?")
        break
      else
        prompt("Error. Please try again.")
      end
    end
    
    loan_duration = gets().chomp()
    if loan_duration == '0'
      prompt("Duration cannot be 0!")
    elsif loan_duration.to_f < 0
      prompt("Duration cannot be negative!")
    elsif valid_num?(loan_duration)
      break
    else
      prompt("Please enter a valid number")
    end
  end
  
  monthly_interest_pct = ( apr.to_f / 12 ) / 100
  if timeframe == 'y'
    loan_duration = loan_duration.to_f * 12
  else
    loan_duration = loan_duration.to_f
  end
  
  payment = calculate_payment(loan_amount.to_f, monthly_interest_pct, loan_duration)
  
  prompt("Your monthly payment will be: $#{payment}")

  prompt("Would you like to calculate another loan? (y/n)")
  answer = gets().chomp()
  break unless answer.downcase().start_with?('y')
end