class Game
  attr_reader :name

  def initialize(name)
    @name = name
  end

end

class Library
  def initialize()
    @games = []
  end

  def add_game(game)
    @games << game
  end
end