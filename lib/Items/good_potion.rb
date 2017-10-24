class Good_potion < Items
	def initialize
		super
		@name = "Good potion"
		@value = 12
	end

	def use
		if $player.hp == $player.max_hp
			anim("You are already at full HP!")
			$inventory.add_item(Good_potion.new)
		else
			anim("You use a health potion")
			$player.heal(10)
		end
	end
end

