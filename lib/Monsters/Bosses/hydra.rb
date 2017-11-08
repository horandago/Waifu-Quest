class Hydra < Monster
  def initialize
    super
    @hp = 35
    @name = "Hydra"
    @attack_lo = 6
		@attack_hi = 11
		@exp = 60
		@is_boss = true
	end
	
	def description
		anim("A large blue water beast with three terrorfying heads")
	end

	def action
		anim("The hydra bites at you with all of its heads one after another!!")
		$player.hurt(rand(@attack_lo...@attack_hi))
	end

	def alive?
		self.hp > 0
	end

  def drop
		@drop_item = Mithril.new
    @drop_gold = 100
    $inventory.add_item(@drop_item)
    $player.gp += @drop_gold
    anim("The #{self.name} dropped #{@grammar}#{@drop_item.to_s} and #{@drop_gold}gp!")
  end

end

$hydra = Hydra.new
