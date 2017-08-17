VALID_CHOICES = %w(rock paper scissors) # order of these is important!

def prompt(message)
  puts "=> #{message}"
end

def display_results(user_choice, computer_choice)
  prompt "You chose #{user_choice}; computer chose #{computer_choice}"
  user_choice_index = VALID_CHOICES.index(user_choice)
  computer_choice_index = VALID_CHOICES.index(computer_choice)
  # use mod 3 arithmatic on these indexes to find the winner
  if (user_choice_index - computer_choice_index) % VALID_CHOICES.size == 1
    prompt "You win!"
  elsif (computer_choice_index - user_choice_index) % VALID_CHOICES.size == 1
    prompt "The computer won."
  else
    prompt "It's a tie."
  end
  puts
end

loop do
  prompt "Choose one: " + VALID_CHOICES.join(', ') + " (or type q to quit)."
  user_choice = gets.chomp
  if VALID_CHOICES.include?(user_choice)
    computer_choice = VALID_CHOICES.sample
    display_results user_choice, computer_choice
  elsif user_choice.downcase.start_with?('q')
    prompt "Thanks for playing!"
    break
  else
    prompt "That's not a valid choice."
  end
end
