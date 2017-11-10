class Skills
    attr_reader :name
    def initialize
    end

    def to_s
      "#{@name}"
    end
    
    def cast
      puts "Nothing happens"
    end
end
