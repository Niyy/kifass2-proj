class Game
    attr_gtk
    attr_accessor :loaded


    def initialize
        @loaded = 0
        @actors = {}
    end


    def defaults
        return if @loaded >= 100

        @player = Player.new
        @player.speed = 3

        @enemy_pool = []

        @loaded = 100 
    end

    
    def tick
        defaults

        if @enemy_pool.length < 3
            enemy = Actor.new
            enemy.x = (rand * 1280) - enemy.w
            enemy.y = (rand * 740) - enemy.h

            @enemy_pool << enemy
        end

        @player.move inputs

        outputs.sprites << @enemy_pool.map do |enemy| enemy.render end
        outputs.sprites << @player.render
    end
end


def tick args
    $game ||= Game.new
    
    $game.args = args
    $game.tick
end
