class Game
  attr_reader :name

  def initialize(name)
    @name = name
    @year = nil
    @system = nil
  end

  # Add methods to store year and system

  def system(data, &block)
    @system = data
  end

  def year(data, &block)
    @year = data
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

LIBRARY = Library.new

def add_game(name, &block)
  game = Game.new(name)
  # Capture the block and call it here
  game.instance_eval(&block)
  LIBRARY.add_game(game)
end