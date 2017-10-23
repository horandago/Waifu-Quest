class Mouse < Monster
  def initialize
    super
    @hp = 5
    @name = "Mouse"
		@attack_lo = 0
    @attack_hi = 2
		@exp = 5
		@items = ["nothing"]
		@gold_lo = 0
		@gold_hi = 6
	end
	
	def description
		anim("A cute little mouse girl")
	end

	def action
		anim("The mouse scratches at you!")
		$player.hurt(rand(@attack_lo...@attack_hi))
	end
end
