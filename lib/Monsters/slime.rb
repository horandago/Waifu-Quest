class Slime < Monster
  def initialize
    super
    @hp = 8
    @name = "Slime"
    @attack_lo = 2
		@attack_hi = 4
		@exp = 10
		@items = [Potion.new, "nothing"]
		@gold_lo = 0
		@gold_hi = 10
	end
	
	def description
		anim("A woman made out of green slime and a sticky shirt")
	end

	def action
		anim("The slime squirts goo at you!")
		$player.hurt(rand(@attack_lo...@attack_hi))
	end
end

