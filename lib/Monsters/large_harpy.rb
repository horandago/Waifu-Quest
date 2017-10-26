class Large_harpy < Monster
  def initialize
    super
    @hp = 13
    @name = "Large harpy"
		@attack_lo = 4
    @attack_hi = 8
		@exp = 15
		@items = [Good_potion.new, "nothing", "nothing"]
		@gold_lo = 4
		@gold_hi = 15
	end
	
	def description
		anim("A cute looking harpy with larger....wings")
	end

	def action
		anim("The harpy smothers you with her...wings")
		$player.hurt(rand(@attack_lo...@attack_hi))
	end
end
