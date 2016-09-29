class Library
  SYSTEMS = ['arcade', 'atari', 'pc']

  attr_accessor :games

  def method_missing(name, *args)
    system = name.to_s

    if SYSTEMS.include?(system)
      Library.class_eval do
        define_method(system) do
          send(:find_by_system, system)
        end
      end
    else
      super
    end

  end

  private

  def find_by_system(system)
    games.select { |game| game.system == system }
  end
end

lib = Library.new
lib.arcade