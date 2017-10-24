class Bandit_queen < Monster
  def initialize
    super
    @hp = 15
    @name = "Bandit Queen"
    @attack_lo = 2
		@attack_hi = 6
		@exp = 30
		@is_boss = true
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

  def drop
		anim("Bandit queen: \"Hmph, you have defeated me...\"")
		anim("Bandit queen: \"Fine, you may cross the bridge for free...\"")
		$game.continue
		anim("Bandit queen: \"Here, take this map...it's not like I really need it or anything!\"")
		anim("Bandit queen: \"And..AND IT'S NOT THAT I CARE ABOUT YOU OR ANYTHING!!")
    $game.continue
		anim("Your map has been updated\nThe bandit queen runs off...")
		@drop_item = Rapier.new
		$map.level = 2
    @drop_gold = 25
    $inventory.add_item(@drop_item)
    $player.gp += @drop_gold
    anim("The #{self.name} dropped #{@grammar}#{@drop_item.to_s} and #{@drop_gold}gp!")
  end

end

$bandit_queen = Bandit_queen.new
