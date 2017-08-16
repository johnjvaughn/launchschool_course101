# functions

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  /\d/.match(number) && /^\d*\.?\d*$/.match(number)
end

# welcome
prompt("Welcome to Loan Payment Calculator!")

# prompt user for loan amount in $
principal, apr, num_years = nil
loop do
  prompt("What is the loan amount in dollars?")
  principal = gets.chomp.gsub(/[$,_]/, '').to_f.round(2)

  # prompt user for APR as a percentage
  prompt("What is the APR (annual percentage rate) as a percentage?")
  apr = gets.chomp.to_f

  # prompt user for loan duration in num_years
  prompt("What is the loan duration in num_years?")
  num_years = gets.chomp.to_i

  prompt format("           Loan Amount: $%0.2f", principal)
  prompt "Annual Percentage Rate: #{apr}%"
  prompt "         Loan Duration: #{num_years} years"
  prompt "OK? (y/n)"
  break if gets.downcase.start_with?('y')
end

# from the APR (annual percentage rate), calculate the monthly interest rate
mdr = ((1 + (apr / 100.0))**(1.0 / 12)) - 1   # as a decimal
mpr = 100 * mdr                               # as a percentage
# from the loan duration (num_years), calculate the loan duration in months
num_months = 12 * num_years

# apply the formula m = p * (j / (1 - (1 + j)**(-n)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months
monthly_payment = (principal * (mdr / (1 - (1 + mdr)**-num_months))).ceil(2)

# display result
prompt "       Monthly interest rate: #{mpr.round(6)}%"
prompt "                      Months: #{num_months}"
prompt format("The monthly payment would be: $%0.2f", monthly_payment)
