class Spells
    attr_reader :name, :combat_spell
    def initialize
      @combat_spell = true
    end

    def to_s
      "#{@name}"
    end
    
    def cast
      puts "Nothing happens"
    end
end
