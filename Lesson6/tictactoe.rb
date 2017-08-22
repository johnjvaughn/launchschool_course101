# rubocop:disable Style/EndOfLine
require('pry')

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                 [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                 [1, 5, 9], [3, 5, 7]] # diagonals
GAMES_TO_WIN_MATCH = 5
WHO_GOES_FIRST = :choose # can be :player, :computer, or :choose

def prompt(message)
  puts "=> #{message}"
end

def joinor(items, sep = ',', conjunction = 'or')
  if items.size <= 2
    items.join(" #{conjunction} ")
  else
    items[0..-2].join("#{sep} ") + "#{sep} #{conjunction} #{items.last}"
  end
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(board)
  space_nums = {}
  board.each do |square, marker|
    space_nums[square] = marker == INITIAL_MARKER ? square : ' '
  end

  system 'cls'

  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "#{space_nums[1]}    |#{space_nums[2]}    |#{space_nums[3]}"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "#{space_nums[4]}    |#{space_nums[5]}    |#{space_nums[6]}"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "#{space_nums[7]}    |#{space_nums[8]}    |#{space_nums[9]}"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def initialize_score
  { player: 0, computer: 0 }
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def player_places_piece!(board)
  square_to_play = nil
  loop do
    prompt "Choose a square (#{joinor(empty_squares(board))}):"
    square_to_play = gets.to_i
    break if empty_squares(board).include?(square_to_play)
    prompt "Sorry, that's not a valid choice."
  end
  board[square_to_play] = PLAYER_MARKER
end

def computer_find_at_risk_square(board)
  # defensive AI: look for a row/column/diag with 2 player markers and 1 open
  # space, to block (return nil if not found)
  WINNING_LINES.each do |line|
    board_line = board.select { |square, _| line.include?(square) }
    if board_line.values.count(PLAYER_MARKER) == 2 &&
       board_line.value?(INITIAL_MARKER)
      return board_line.key(INITIAL_MARKER)
    end
  end
  nil
end

def computer_find_winning_square(board)
  # offensive AI: look for a row/column/diag with 2 computer markers and 1 open
  # space, to win immediately (return nil if not found)
  WINNING_LINES.each do |line|
    board_line = board.select { |square, _| line.include?(square) }
    if board_line.values.count(COMPUTER_MARKER) == 2 &&
       board_line.value?(INITIAL_MARKER)
      return board_line.key(INITIAL_MARKER)
    end
  end
  nil
end

def computer_places_piece!(board)
  # try to get a square through one of the strategic methods
  # next, choose square 5 if available
  # otherwise, choose randomly
  open_squares = empty_squares(board)
  square_to_play = computer_find_winning_square(board)
  square_to_play ||= computer_find_at_risk_square(board)
  square_to_play ||= open_squares.include?(5) ? 5 : open_squares.sample
  board[square_to_play] = COMPUTER_MARKER
end

def place_piece!(board, which_player)
  if which_player == :player
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  current_player == :player ? :computer : :player
end

def someone_won?(board)
  player_won = WINNING_LINES.any? do |row|
    row.all? do |num|
      board[num] == PLAYER_MARKER
    end
  end
  computer_won = WINNING_LINES.any? do |row|
    row.all? do |num|
      board[num] == COMPUTER_MARKER
    end
  end
  if player_won
    :player
  elsif computer_won
    :computer
  end
end

def board_full?(board)
  empty_squares(board).empty?
end

def display_match_score(score)
  prompt ""
  prompt "Current Match Score:"
  prompt "(first player to reach #{GAMES_TO_WIN_MATCH} wins the match)"
  score.each do |competitor, num_wins|
    prompt "#{competitor.capitalize}: #{num_wins}"
  end
  prompt ""
end

def check_if_match_over(score)
  score.each do |competitor, num_wins|
    if num_wins >= GAMES_TO_WIN_MATCH
      return competitor.capitalize
    end
  end
  false
end

def determine_who_starts
  if WHO_GOES_FIRST == :choose
    who_goes_first = nil
    until who_goes_first
      puts "Which player will go first? (type X for player, O for computer):"
      answer = gets.downcase
      if answer.start_with?('x')
        who_goes_first = :player
      elsif answer.start_with?('o', '0')
        who_goes_first = :computer
      end
    end
    who_goes_first
  else
    WHO_GOES_FIRST
  end
end

match_score = initialize_score

loop do
  board = initialize_board
  display_board(board)
  current_player = determine_who_starts

  loop do
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    game_winner = someone_won?(board)
    display_board(board)
    if game_winner
      prompt "#{game_winner.capitalize} wins this game!"
      match_score[game_winner] += 1
      break
    end
    if board_full?(board)
      prompt "This game is a tie."
      break
    end
  end

  display_match_score(match_score)
  match_winner = check_if_match_over(match_score)
  if match_winner
    prompt "#{match_winner} has won the match!"
    match_score = initialize_score
    prompt "Start a new match? (y/n)"
  else
    prompt "Play again? (y/n)"
  end
  break unless gets.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe. Goodbye!"
