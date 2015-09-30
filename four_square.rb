class ConnectFour

  def initialize
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
    @current_player = player1
    @board = Board.new
  end

  def welcome
    
  end


  def change_player
    if @current_player == @player1 
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def player_move
    
  end


  #check if there is a winner: if player has made four in a row
  def winner

  end

end  #end of ConnectFour class

class Player

  def initialize(color)
    @color = color
  end

end

class Board
  def initialize
    @board = set_up_board
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
    print " #{[1,2,3,4,5,6,7].join("  ")} \n"
    @board.each do |row|
      print "| #{row.join("  ")} | \n"
    end
    print ""
    @board    
  end

end

