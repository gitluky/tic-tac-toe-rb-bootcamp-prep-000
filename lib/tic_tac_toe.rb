# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
def won?(board)
  WIN_COMBINATIONS.detect do |set|
    board[set[0]] == board[set[1]] &&
    board[set[1]] == board[set[2]] &&
    position_taken?(board,set[0])
  end
end

def full?(board)
  board.all? {|value| value == "X" || value == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def turn_count(board)
  count = 0
  board.each do |location|
    if location != " "
      count+=1
    end
  end
  return count
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X": "O"
end
