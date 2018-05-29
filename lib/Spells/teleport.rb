class Teleport < Spells
    def initialize
        super
        @name = "Teleport"
        @combat_spell = false
    end

    def cast
        puts "TELPORT!"
    end

end

$teleport = Teleport.new
