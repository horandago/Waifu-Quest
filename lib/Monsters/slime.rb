class Slime < Monster
  def initialize
    super
    @hp = 8
    @name = "Slime"
    @attack_lo = 2
		@attack_hi = 4
		@exp = 10
		@items = [Potion.new, Goo.new, "nothing"]
		@gold_lo = 3
		@gold_hi = 12
	end
	
	def description
		anim("A woman made out of green slime and a sticky shirt")
	end

	def action
		anim("The slime squirts goo at you!")
		$player.hurt(rand(@attack_lo...@attack_hi))
	end
end

