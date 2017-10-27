class Mermaid < Monster
  def initialize
    super
    @hp = 13
    @name = "Mermaid"
		@attack_lo = 3
    @attack_hi = 7 
		@exp = 14
		@items = [Potion.new, "nothing"]
		@gold_lo = 6
		@gold_hi = 18
	end
	
	def description
		anim("A beautiful blue haired mermaid...who looks angry")
	end

	def action
		anim("The mermaid stabs you with her tridant!")
		$player.hurt(rand(@attack_lo...@attack_hi))
	end
end
