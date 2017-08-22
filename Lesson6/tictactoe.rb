require('pry')

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                 [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                 [1, 5, 9], [3, 5, 7]] # diagonals

def prompt(message)
  puts "=> #{message}"
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

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def player_places_piece!(board)
  square = nil
  loop do
    prompt "Choose a square (#{empty_squares(board).join(',')}):"
    square = gets.to_i
    break if empty_squares(board).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  board[square] = PLAYER_MARKER
end

def computer_places_piece!(board)
  square = empty_squares(board).sample
  board[square] = COMPUTER_MARKER
end

def someone_won?(board, marker)
  WINNING_LINES.any? do |row|
    row.all? do |num|
      board[num] == marker
    end
  end
end

def board_full?(board)
  empty_squares(board).empty?
end

loop do
  board = initialize_board
  display_board(board)
  game_result = ''

  loop do
    player_places_piece!(board)
    if someone_won?(board, PLAYER_MARKER)
      game_result = "Player wins!"
      break
    end
    computer_places_piece!(board)
    if someone_won?(board, COMPUTER_MARKER)
      game_result = "Computer wins"
      break
    end
    if board_full?(board)
      game_result = "It's a tie."
      break
    end
    display_board(board)
  end

  display_board(board)
  prompt game_result

  prompt "Play again? (y/n)"
  break unless gets.chomp.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe. Goodbye!"
