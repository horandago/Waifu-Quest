class Wizard < Monster
  def initialize
    super
    @hp = 40
    @name = "Wizard"
    @attack_lo = 10
		@attack_hi = 21
		@exp = 250
		@is_boss = true
	end
	
	def description
		anim("A dark looking wizard but with glowing white hair")
	end

	def action
    @element = ["fire", "water", "wind", "earth"]
		anim("The wizard casts a #{@element.sample} spell at you")
		$player.hurt(rand(@attack_lo...@attack_hi))
	end

	def alive?
		self.hp > 0
	end

  def drop
		@drop_item = $magical_hat
    @drop_gold = 300
		$map.level = 3
    $inventory.add_item(@drop_item)
    $player.gp += @drop_gold
    anim("The #{self.name} dropped #{@grammar}#{@drop_item.to_s} and #{@drop_gold}gp!")
    anim("Your map has been updated!".colorize(:green)) 
		$inventory.spells.push($teleport)
		anim("You learned TELEPORT!".colorize(:green))
 end

end

$wizard = Wizard.new
