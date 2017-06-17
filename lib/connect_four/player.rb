module ConnectFour
  class Player
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def turn
      print "[#{name}]: "
      STDIN.gets.chomp
    end
  end
end
