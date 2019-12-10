# require_relative "players"
class Game
  attr_accessor :player1, :player2, :current_player, :game_playing
  def initialize
    @player1 = Players.new("player1", 3)
    @player2 = Players.new("player2", 3)
    @current_player = self.player1
    @game_playing = true
  end

  # Decide the player to start first
  def playerTurn
    if @current_player == @player1
      @current_player = @player2
    else 
      @current_player = @player1
    end
    return @current_player
  end

  # Generate question function
  def question_generator
    random_1 = rand(1...20)
    random_2 = rand(1...20)
    random_answer = random_1 + random_2;
    puts "what is #{random_1} plus #{random_2}?"
    return random_answer
  end

  #start a round of game
  def start_round
    puts "TURN: #{current_player.name}"
    #Answer of the current question
    answer = question_generator
    user_input = Integer(gets.chomp)

    #check with real answer
    if answer === user_input
      puts "YES! #{current_player.name} you are correct"

    else
      puts "No! #{current_player.name} you are wrong!"
      self.current_player.life -= 1
    end
    
    puts "P1: #{@player1.life}/3 vs P2: #{@player2.life}/3"
    
    if @current_player.life == 0
      @game_playing = false
      puts "----- GAME OVER -----" 
      if @player1.life > @player2.life
        puts "#{player1.name} won with score of #{player1.life}/3"
      else
        puts "#{player2.name} won with score of #{player2.life}/3"
      end
    end
  end

  # starting a game
  def game_play
    while @game_playing == true
      playerTurn
      start_round
    end
  end
end
