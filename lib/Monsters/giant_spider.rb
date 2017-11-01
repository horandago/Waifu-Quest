class Giant_spider < Monster
  def initialize
    super
    @hp = 25
    @name = "Giant Spider"
		@attack_lo = 5
    @attack_hi = 14
		@exp = 25
		@items = [Web.new, Giga_potion.new, "nothing"]
		@gold_lo = 5
		@gold_hi = 18
	end
	
	def description
		anim("A dark looking girl who is a spider on the bottom and human on the top...\nWhatever you're into I guess but you're playing this game for a reason, right?!")
	end

	def action
		anim("The spider shoots her web at you!")
		$player.hurt(rand(@attack_lo...@attack_hi))
	end
end
