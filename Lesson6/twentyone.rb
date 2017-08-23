require 'pry'

RANKS = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
SUITS = ['C', 'D', 'H', 'S']
BUST_IF_OVER = 21
DEALER_STAYS_AT = 17
GAMES_TO_WIN_MATCH = 5

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system('clear') || system('cls')
end

def user_choice(question, choices, accept_first_letter=true)
  choice_hash = {}
  choices.each { |choice| choice_hash[choice.downcase] = choice.downcase[0] }
  choices_out = accept_first_letter ? choices.map(&:capitalize) : choices

  prompt_line = "#{question} (#{choices_out.join('/')})"
  loop do
    prompt prompt_line
    answer = gets.strip.downcase
    if choice_hash.key?(answer)
      return answer
    elsif accept_first_letter && choice_hash.value?(answer)
      return choice_hash.key(answer)
    end
  end
end

def total(cards)
  ranks = cards.map { |card| card[1] }

  sum = 0
  ranks.each do |rank|
    sum += if rank == 'A'
             11
           elsif rank.to_i == 0
             10
           else
             rank.to_i
           end
  end

  ranks.select { |rank| rank == 'A' }.count.times do
    sum -= 10 if sum > BUST_IF_OVER
  end
  sum
end

def initialize_deck
  prompt "Shuffling..."
  SUITS.product(RANKS).shuffle
end

def initialize_score
  { player: 0, dealer: 0 }
end

def deal_new_hand!(deck, player_cards, dealer_cards)
  prompt "Dealing..."
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end
end

def deal_another_card!(deck, hand)
  hand << deck.pop
end

def show_hand(cards, player, total=0)
  puts
  if total > 0
    output = cards.map { |card| card.reverse.join }.join(', ')
    prompt "#{player.capitalize} has: #{output} (total = #{total})"
  else
    # this is for the case when we only show one dealer card up
    prompt "#{player.capitalize} has #{cards[0].reverse.join} showing"
  end
end

def busted?(total)
  total > BUST_IF_OVER
end

def decide_winner(player_total, dealer_total)
  if busted?(player_total)
    :dealer
  elsif busted?(dealer_total)
    :player
  elsif player_total > dealer_total
    :player
  elsif dealer_total > player_total
    :dealer
  end
end

def display_winner(player_total, dealer_total)
  puts
  puts "==============================="
  if busted?(player_total)
    prompt "Dealer wins due to Player BUST!"
  elsif busted?(dealer_total)
    prompt "Player wins due to Dealer BUST!"
  elsif player_total > dealer_total
    prompt "Player wins, #{player_total} to #{dealer_total}!"
  elsif dealer_total > player_total
    prompt "Dealer wins, #{dealer_total} to #{player_total}!"
  else
    prompt "It's a tie, #{player_total} each."
  end
  puts "==============================="
  puts
end

def display_match_score(score)
  prompt "Current Match Score:"
  prompt "(first player to reach #{GAMES_TO_WIN_MATCH} wins the match)"
  score.each do |competitor, num_wins|
    prompt "#{competitor.capitalize}: #{num_wins}"
  end
  prompt ""
end

def check_for_a_match_winner(score)
  score.each do |competitor, num_wins|
    if num_wins >= GAMES_TO_WIN_MATCH
      return competitor.capitalize
    end
  end
  nil
end

def display_match_results(winner)
  puts "*******************************"
  prompt "#{winner} has won the match!"
  puts "*******************************"
  puts
end

# main program
clear_screen
prompt "Welcome to Twenty-One!"
puts
match_score = initialize_score

loop do
  deck = initialize_deck
  player_hand = []
  dealer_hand = []

  deal_new_hand!(deck, player_hand, dealer_hand)
  dealer_total = total(dealer_hand)
  show_hand(dealer_hand, :dealer)
  player_total = total(player_hand)
  show_hand(player_hand, :player, player_total)
  winner = nil

  loop do
    break if player_total == BUST_IF_OVER # exactly 21, no need to ask
    break if user_choice("What's your action?", ['hit', 'stay']) == 'stay'
    deal_another_card!(deck, player_hand)
    player_total = total(player_hand)
    show_hand(player_hand, :player, player_total)
    if busted?(player_total)
      prompt "Sorry, you BUST."
      winner = :dealer
      break
    end
  end

  show_hand(dealer_hand, :dealer, dealer_total)

  unless winner
    # no need for dealer to hit if player has already busted
    loop do
      if dealer_total >= DEALER_STAYS_AT
        if dealer_total == BUST_IF_OVER
          prompt "Dealer has #{BUST_IF_OVER}."
        else
          prompt "Dealer STAYS."
        end
        break
      end
      deal_another_card!(deck, dealer_hand)
      prompt "Dealer takes a HIT."
      dealer_total = total(dealer_hand)
      show_hand(dealer_hand, :dealer, dealer_total)
      if busted?(dealer_total)
        prompt "Dealer BUSTS."
        winner = :player
        break
      end
    end
  end

  display_winner(player_total, dealer_total)
  winner = decide_winner(player_total, dealer_total)
  match_score[winner] += 1 if winner
  display_match_score(match_score)
  match_winner = check_for_a_match_winner(match_score)
  if match_winner
    display_match_results(match_winner)
    match_score = initialize_score
    break if user_choice("Start a new match?", ['yes', 'no']) == 'no'
  elsif user_choice("Play again?", ['yes', 'no']) == 'no'
    break
  end
  clear_screen
end

clear_screen
prompt "Thanks for playing Twenty-One. Goodbye!"
