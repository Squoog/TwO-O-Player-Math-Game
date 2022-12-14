class Question
  attr_accessor :x, :y

  def initialize
    @x = rand(1..10)
    @y = rand(1..10)
  end

  def solution
    return @x + @y
  end
end