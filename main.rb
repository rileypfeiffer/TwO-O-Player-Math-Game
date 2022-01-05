require './player'
require './question'

class Game
  def initialize
    @player1 = Player.new("Player 1", true)
    @player2 = Player.new("Player 2", false)
  end

  def turn
    question
    check_answer
  end

  def check_winner
    if @player1.lives == 0
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
      puts '----- GAME OVER -----'
      puts 'Good bye!'
    elsif @player2.lives == 0
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
      puts '----- GAME OVER -----'
      puts 'Good bye!'
    else
      turn
    end
  end

  def question
    @new_question = Question.new
    
    if @player1.turn
      puts "#{@player1.name}: #{@new_question.question}"
    else
      puts "#{@player2.name}: #{@new_question.question}"
    end
  end

  def check_answer
    if gets.chomp.to_i == @new_question.answer
      puts "YES! You are correct."
      if @player1.turn
        @player1.turn = false
        @player2.turn = true
      else
        @player1.turn = true
        @player2.turn = false
      end
    else
      puts "Seriously? No!"
      if @player1.turn
        @player1.lives -= 1
        @player1.turn = false
        @player2.turn = true
      else
        @player2.lives -= 1
        @player1.turn = true
        @player2.turn = false
      end
    end

    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    check_winner
  end

end

game = Game.new
game.turn