require "./question"
require "./player"

class Game
  def initialize
    @p1 = Player.new("Player 1")
    @p2 = Player.new("Player 2")
  end

  def ask_question
    if @p1.lives != 0
      question = Question.new
      p1_x = question.x
      p1_y = question.y
      p1_answer = question.solution

      puts "#{@p1.name}: What is #{p1_x} plus #{p1_y} equal to?"
      print "Your answer: "

      p1_response = gets.chomp.to_i

      validate(@p1, p1_response, p1_answer)
      calculate_lives
    end

    if @p2.lives != 0
      question = Question.new
      p2_x = question.x
      p2_y = question.y
      p2_answer = question.solution

      puts "#{@p2.name}: What is #{p2_x} plus #{p2_y} equal to?"
      print "Your answer: "

      p2_response = gets.chomp.to_i

      validate(@p2, p2_response, p2_answer)
      calculate_lives
    end

    if (!game_over)
      ask_question
    end

  end

  def validate(player, input, answer)
    player == @p1 ? 
    (if input == answer
      puts "#{@p1.name}: Correct."
    else 
      puts "#{@p1.name}: Incorrect."
      @p1.lives -= 1
    end) : 
    (if input == answer
    puts "#{@p2.name}: Correct."
    else 
      puts "#{@p2.name}: Incorrect."
      @p2.lives -= 1
    end)
  end

  def calculate_lives
    if @p1.lives == 0
      puts "#{@p2.name} wins with #{@p2.lives} remaining lives\n"
      puts "GAME OVER"
    elsif @p2.lives == 0
      puts "#{@p1.name} wins with #{@p1.lives} remaining lives\n"
      puts "GAME OVER"
    else 
      puts "P1: #{@p1.lives} lives\nP2: #{@p2.lives} lives\n"
    end
  end

  def game_over
    return (!(@p1.lives != 0 && @p2.lives != 0))
  end

end