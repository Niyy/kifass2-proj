class Player < Actor
    attr_accessor :speed



    def move(inputs)
        facing_vector = [inputs.mouse.x - @x - @w_half, 
            inputs.mouse.y - @y - @h_half]
        direction = Math.atan2 facing_vector.y, facing_vector.x
        active_speed = 0

        return if dist_from_mouse(inputs.mouse) <= 64 

        if inputs.keyboard.key_down.w || inputs.keyboard.key_held.w
            active_speed = @speed
        end
        
        x_polar = Math.cos direction
        y_polar = Math.sin direction

        $gtk.args.outputs.lines << [@x + @w / 2, @y + @h / 2, 
                                    (@x + @w / 2) + (x_polar * 62), 
                                    (@y + @h / 2) + (y_polar * 62)]

        @x += active_speed * x_polar 
        @y += active_speed * y_polar
    end


    def dist_from_mouse(mouse)
        x = mouse.x - @x - @w_half
        y = mouse.y - @y - @h_half

        x *= x
        y *= y

        return  x + y
    end
end
