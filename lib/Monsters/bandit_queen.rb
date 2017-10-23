class Bandit_queen < Monster
  def initialize
    super
    @hp = 15
    @name = "Bandit Queen"
    @attack_lo = 2
		@attack_hi = 6
		@exp = 10
		@items = [Rapier.new]
		@gold_lo = 20
		@gold_hi = 21
	end
	
	def description
		anim("A fierce but sexy looking bandit is glaring at you")
	end

	def action
		anim("The bandit queen slashes at you!")
		$player.hurt(rand(@attack_lo...@attack_hi))
	end

	def alive?
		self.hp > 0
	end
end

$bandit_queen = Bandit_queen.new
