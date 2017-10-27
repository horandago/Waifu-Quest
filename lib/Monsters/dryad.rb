class Dryad < Monster
  def initialize
    super
    @hp = 15
    @name = "Dryad"
		@attack_lo = 3
    @attack_hi = 8
		@exp = 17
		@items = [Rope.new, Good_potion.new, "nothing"]
		@gold_lo = 5
		@gold_hi = 18
	end
	
	def description
		anim("A majestic looking dryad")
	end

	def action
		anim("The dryad kicks you in the knees! Ouch!")
		$player.hurt(rand(@attack_lo...@attack_hi))
	end
end
