class Game
  def initialize(name)
    @name = name
    @year = nil
    @system = nil
    @tags = []
  end

  def year(value)
    @year = value
  end

  def system(value)
    @system = value
  end

  def print_details
    puts "#{@name} - #{@year} (#{@system})"
  end

  def play
  end

  def capture_screenshot
  end

  def method_missing(method)
    @tags << method.to_s
  end
end

class Library
  def initialize
    @games = []
  end
  def add_game(game)
    @games << game
  end
  def find_by_name(name)
    @games.detect { |game| game.name == name }
  end
end

LIBRARY = Library.new

def add_game(name, system=nil, year=nil, &block)
  game = Game.new(name)
  game.system(system) if system
  game.year(year) if year
  # Capture the block and call it here
  game.instance_eval(&block) if block_given?
  LIBRARY.add_game(game)
end

def with_game(*names, &block)
  names.each do |name|
    game = LIBRARY.find_by_name(name)
    game.instance_eval(&block)
  end
end

add_game "Civilization" do
  system "PC"
  year 1991
end

add_game "Contra" do
  system "NES"
  year 1987
end
with_game "Contra" do
  print_details
  play
  capture_screenshot
end

add_game "Capa", "Mac", 2016
with_game "Capa", "Contra" do
  print_details
end