class Actor
    attr_accessor :x, :y
    attr_reader :idx, :w, :h, :sprite, :history


    @@idx_file = 0


    def initialize
        @idx = @@idx_file
        @x = 0
        @y = 0
        @w = 32
        @h = 32
        @w_half = @w / 2
        @h_half = @h / 2
        @sprite = {x: 0, y: 0, w: 32, h: 32, path: 'sprites/circle/red.png'}
        # Could be RAM abusive and may need to be offloaded or purge old
        # data after size gets to large.
        @history = {x: [], y: [], sprite: [], w: [], h: []}

        @@idx_file += 1
    end


    def render
        return {x: @x + @sprite.x, y: @y + @sprite.y, w: @sprite.w, 
                h: @sprite.h, path: @sprite.path}
    end


    def x mod
        @history.x << @x
        @x += mod
    end


    def y mod,
          sadness = 10
        @history.y << @y
        @y += mod
    end
end
