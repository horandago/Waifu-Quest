class Lava_golem < Monster
  def initialize
    super
    @hp = 50
    @name = "Lava Golem"
    @attack_lo = 10
		@attack_hi = 18
		@exp = 300
		@is_boss = true
	end
	
	def description
		anim("A gigantic rock golem dripping with moleen lava")
	end

	def action
		anim("The golem hurls its giant fists at you!")
		$player.hurt(rand(@attack_lo...@attack_hi))
	end

	def alive?
		self.hp > 0
	end

  def drop
		@drop_item = $secret_map
    @drop_gold = 300
    $inventory.add_item(@drop_item)
    $player.gp += @drop_gold
    anim("The #{self.name} dropped #{@grammar}#{@drop_item.to_s} and #{@drop_gold}gp!")
  end

end

$lava_golem = Lava_golem.new
