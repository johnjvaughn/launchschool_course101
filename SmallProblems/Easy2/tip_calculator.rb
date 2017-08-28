puts "What is the bill?"
bill_subtotal = gets.to_f
puts "What is the tip percentage?"
tip_pctg = gets.to_f

tip_amount = (tip_pctg * bill_subtotal / 100).round(2)
bill_total = bill_subtotal + tip_amount
puts format "The tip is $%0.2f.", tip_amount
puts format "The total is $%0.2f.", bill_total