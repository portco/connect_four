module ConnectFour
  class Player
    attr_reader :name, :number
    attr_accessor :position

    def initialize(name, number, position=[])
      @name = name
      @number = number
      @position = position
    end

    def move
      print "[#{name} (#{number})]: "
      Integer(STDIN.gets.chomp) rescue nil
    end
  end
end
