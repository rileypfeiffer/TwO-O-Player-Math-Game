class Player
  attr_reader :name
  attr_accessor :lives, :turn

  def initialize(name, turn)
    @name = name
    @lives = 3
    @turn = turn
  end
end