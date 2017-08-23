# rubocop:disable Style/EndOfLine
require('pry')

RANKS = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
SUITS = ['C', 'D', 'H', 'S']
BUST_IF_OVER = 21
DEALER_STAYS_AT = 17
GAMES_TO_WIN_MATCH = 5

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system('clear') or system('cls')
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

def decide_winner_and_display(player_total, dealer_total)
  # this generates a rubocop warning about too many lines
  puts "==============================="
  if busted?(player_total)
    prompt "Dealer wins due to Player BUST!"
    winner = :dealer
  elsif busted?(dealer_total)
    prompt "Player wins due to Dealer BUST!"
    winner = :player
  elsif player_total > dealer_total
    prompt "Player wins, #{player_total} to #{dealer_total}!"
    winner = :player
  elsif dealer_total > player_total
    prompt "Dealer wins, #{dealer_total} to #{player_total}!"
    winner = :dealer
  else
    prompt "It's a tie, #{player_total} each."
    winner = nil
  end
  puts "==============================="
  winner
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
  false
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
  puts
  dealer_total = total(dealer_hand)
  show_hand(dealer_hand, :dealer)
  puts
  player_total = total(player_hand)
  show_hand(player_hand, :player, player_total)
  winner = nil

  loop do
    break if player_total == BUST_IF_OVER
    prompt "(H)IT or (S)TAY?"
    answer = gets.downcase
    if answer.start_with?('s')
      break
    elsif !answer.start_with?('h')
      next
    end
    deal_another_card!(deck, player_hand)
    player_total = total(player_hand)
    show_hand(player_hand, :player, player_total)
    if busted?(player_total)
      prompt "Sorry, you BUST."
      winner = :dealer
      break
    end
  end

  puts
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

  puts
  winner = decide_winner_and_display(player_total, dealer_total)
  puts

  match_score[winner] += 1 if winner
  display_match_score(match_score)
  match_winner = check_for_a_match_winner(match_score)
  if match_winner
    display_match_results(match_winner)
    match_score = initialize_score
    prompt "Start a new match? ([y]/n)"
  else
    prompt "Play again? ([y]/n)"
  end
  break if gets.downcase.start_with?('n')
  clear_screen
end

clear_screen
prompt "Thanks for playing Twenty-One. Goodbye!"
