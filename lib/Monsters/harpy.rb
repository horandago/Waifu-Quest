class Harpy < Monster
  def initialize
    super
    @hp = 5
    @name = "Harpy"
		@attack_lo = 1
    @attack_hi = 3
		@exp = 10
		@items = [Potion.new, "nothing"]
		@gold_lo = 0
		@gold_hi = 10
	end
	
	def description
		anim("A cute looking girl with bright blue wings and a beak")
	end

	def action
		anim("The harpy flaps a strong wind at you!")
		$player.hurt(rand(@attack_lo...@attack_hi))
	end
end
