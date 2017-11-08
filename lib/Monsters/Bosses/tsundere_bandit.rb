class Tsundere_bandit < Monster
  def initialize
    super
    @hp = 15
    @name = "Tsundere Bandit"
    @attack_lo = 2
		@attack_hi = 6
		@exp = 30
		@is_boss = true
	end
	
	def description
		anim("A fierce but sexy looking bandit is glaring at you")
	end

	def action
		anim("The tsundere bandit slashes at you!")
		$player.hurt(rand(@attack_lo...@attack_hi))
	end

	def alive?
		self.hp > 0
	end

  def drop
		anim("Tsundere bandit: \"Hmph, you have defeated me...\"")
		anim("Tsundere bandit: \"Fine, you may cross the bridge for free...\"")
		$game.continue
		anim("Tsundere bandit: \"Here, take this map...it's not like I really need it or anything!\"")
		anim("Tsundere bandit: \"And..AND IT'S NOT THAT I CARE ABOUT YOU OR ANYTHING!!")
    $game.continue
		anim("Your map has been updated\nThe tsundere bandit runs off...")
		@drop_item = Rapier.new
		$map.level = 2
    @drop_gold = 25
    $inventory.add_item(@drop_item)
    $player.gp += @drop_gold
    anim("The #{self.name} dropped #{@grammar}#{@drop_item.to_s} and #{@drop_gold}gp!")
    anim("Your map has been updated!".colorize(:green))
  end

end

$tsundere_bandit = Tsundere_bandit.new
