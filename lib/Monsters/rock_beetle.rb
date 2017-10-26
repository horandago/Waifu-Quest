class Rock_beetle < Monster
  def initialize
    super
    @hp = 10
    @name = "Rock Beetle"
    @attack_lo = 0
		@attack_hi = 5
		@exp = 10
		@items = [Potion.new, Rock.new, "nothing"]
		@gold_lo = 0
		@gold_hi = 10
	end
	
	def description
		anim("A small girl peeping out from under a spikey rock shield")
	end

	def action
		anim("You are hit with the spikey sheild")
		$player.hurt(rand(@attack_lo...@attack_hi))
	end
end

