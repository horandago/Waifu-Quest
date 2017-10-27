class Frog_girl < Monster
  def initialize
    super
    @hp = 15
    @name = "Frog girl"
		@attack_lo = 4
    @attack_hi = 8 
		@exp = 18
		@items = [Good_potion.new, "nothing", "nothing"]
		@gold_lo = 8
		@gold_hi = 20
	end
	
	def description
		anim("A wet looking girl with green skin on all fours")
	end

	def action
		anim("The frog's tongue smacks you!")
		$player.hurt(rand(@attack_lo...@attack_hi))
	end
end
