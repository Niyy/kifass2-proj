class Game
    attr_gtk
    attr_accessor :loaded


    def initialize
        @loaded = 0
        @actors = {}
    end


    def defaults
        return if @loaded >= 100

        @loaded = 100 
    end

    
    def tick
        defaults

        @player = Player.new
        @player.speed = 10

        @player.move inputs

        outputs.sprites << @player.render
    end
end


def tick args
    $game ||= Game.new
    
    $game.args = args
    $game.tick
end
