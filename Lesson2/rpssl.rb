# order of these array members is important!
VALID_CHOICES = %w(rock paper scissors spock lizard)
VALID_CHOICES_ABR = %w(r p sc sp l)
GAME_ENDS_AT_SCORE = 5

def prompt(message)
  puts "=> #{message}"
end

def display_choices
  full_choices = []
  VALID_CHOICES.each_with_index do |choice, index|
    full_choices.push("#{choice} (#{VALID_CHOICES_ABR[index]})")
  end
  prompt "Choose one: " + full_choices.join(', ') + " (or type q to quit)."
end

def get_winner(user_choice, computer_choice)
  user_choice_index = VALID_CHOICES.index(user_choice)
  computer_choice_index = VALID_CHOICES.index(computer_choice)
  index_difference = user_choice_index - computer_choice_index
  # use mod 5 arithmatic on these indexes to find the winner
  if index_difference == 0
    :tie
  elsif [1, 3].include?(index_difference % VALID_CHOICES.size)
    # if user's choice is 1 to the right or 3 to the right of computer's,
    # (in a modular sense) user wins
    :user
  else
    :computer
  end
end

def display_results(user_choice, computer_choice, winner)
  prompt "You chose #{user_choice}; computer chose #{computer_choice}"
  case winner
  when :user
    prompt "You win!"
  when :computer
    prompt "The computer won."
  else
    prompt "It's a tie."
  end
  puts
end

def display_score(score)
  prompt "Current Score:"
  prompt "User: #{score[:user]}"
  prompt "Computer: #{score[:computer]}"
  puts
end

def check_for_winner(score)
  if score[:user] >= GAME_ENDS_AT_SCORE
    :user
  elsif score[:computer] >= GAME_ENDS_AT_SCORE
    :computer
  end
end

prompt "Welcome to Rock Paper Scissors Spock Lizard!"
prompt "It's you versus the computer."
prompt "The match ends when someone has #{GAME_ENDS_AT_SCORE} wins."
puts
score = { user: 0, computer: 0, tie: 0 }

loop do
  display_choices
  user_choice = gets.chomp
  if VALID_CHOICES_ABR.include?(user_choice)
    user_choice = VALID_CHOICES[VALID_CHOICES_ABR.index(user_choice)]
  end
  if VALID_CHOICES.include?(user_choice)
    computer_choice = VALID_CHOICES.sample
    winner = get_winner user_choice, computer_choice
    display_results user_choice, computer_choice, winner
    score[winner] += 1
    display_score score
    gameover = check_for_winner(score)
    if gameover
      prompt "Game Over"
      if gameover == :user
        prompt "You win the match!"
      elsif gameover == :computer
        prompt "The computer wins the match."
      end
      break
    end
  elsif user_choice.downcase.start_with?('q')
    prompt "Thanks for playing!"
    break
  else
    prompt "That's not a valid choice."
  end
end
