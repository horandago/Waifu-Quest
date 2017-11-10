class Fireball < Skills
    def initialize
        super
        @name = "Fireball"
        @dmg_lo = 5
        @dmg_hi = 10
    end

    def cast
        rand(@dmg_lo...@dmg_hi)
    end

end

$fireball = Fireball.new
