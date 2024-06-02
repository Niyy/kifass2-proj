class Player < Actor
    attr_accessor :speed


    def move inputs
        facing_vector = [inputs.mouse.x - @x, inputs.mouse.y - @y]
        direction = Math.atan2 facing_vector.y, facing_vector.x
        active_speed = 0

        if inputs.keyboard.key_down.w
            active_speed = @speed
        end
        
        x_polar = Math.cos direction
        y_polar = Math.sin direction

        $gtk.args.outputs.lines << [@x + @w / 2, @y + @h / 2, @x + (x_polar * 62), 
                                    @y + (y_polar * 62)]

        @x += active_speed * x_polar 
        @y += active_speed * y_polar
    end
end
