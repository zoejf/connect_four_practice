class ConnectFour

  def initialize
    blue = "B"
    red = "R"
    @player1 = Player.new("Player 1", blue)
    @player2 = Player.new("Player 2", red)
    @current_player = @player1
    @board = Board.new
  end

  def welcome
    print "Welcome to Connect Four! \n"
    print "#{@player1.name}: #{@player1.color} and #{@player2.name}: #{@player2.color} \n"
    print "#{@player1.name} goes first. \n"
  end

  def player_move(player)
    move = nil
    player = @current_player
    @board.show_board
    print "#{player.name}, choose a column (1 - 7) to place your chip."
    move = gets.chomp.to_i - 1
    #if place_chip was successful
    if @board.place_chip(move, player.color)
      #function to check for winner
      #if there is no winner or fullboard/tie, continue...
      change_player
      player_move(@current_player)
    else
      print "INVALID MOVE: That column is full. \n"
      player_move(@current_player)
    end
  end


  def change_player
    if @current_player == @player1 
      @current_player = @player2
    else
      @current_player = @player1
    end
  end


  #check if there is a winner: if player has made four in a row
  def check_winner

  end

end  #end of ConnectFour class

class Player
  attr_accessor :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end

end

class Board
  def initialize
    @board = set_up_board
    @empty_square = "_"
  end

  def set_up_board
    board = []
    6.times do 
      board.push(["_","_","_","_","_","_","_"])
    end
    board    
  end

  def show_board
    print ""
    print ""
    print " #{[1,2,3,4,5,6,7].join("  ")} \n"
    @board.each do |row|
      print "| #{row.join("  ")} | \n"
    end
    print ""
    @board    
  end

  def place_chip(move, color)
    #first check if column is full
    if @board[0][move] != @empty_square
      return nil 
    else
      row = 5
      while row >= 0
        if @board[row][move] == @empty_square
          return @board[row][move] = color
        else
          row = row - 1
        end
      end
    end
  end

end


