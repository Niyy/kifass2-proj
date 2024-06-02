class Key
    attr_reader :name, :key_val
    attr_accessor :down_when, :up_when


    def activated_down
        $gtk.inputs.key_down[@key_val]
    end
end
