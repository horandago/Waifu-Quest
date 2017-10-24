class Fire_slime < Monster
  def initialize
    super
    @hp = 18
    @name = "Fire slime"
    @attack_lo = 6
		@attack_hi = 11
		@exp = 15
		@items = [Good_potion.new, "nothing"]
		@gold_lo = 5
		@gold_hi = 15
	end
	
	def description
		anim("A burning goo girl who only wants a hug")
	end

	def action
		anim("She throws molten slime at you!")
		$player.hurt(rand(@attack_lo...@attack_hi))
	end
end

