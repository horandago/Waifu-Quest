class Giga_potion < Items
	def initialize
		super
		@name = "Giga potion"
		@value = 10
    @is_usable_battle = true
	end

	def use
		if $player.hp == $player.max_hp
			anim("You are already at full HP!")
			$inventory.add_item(Good_potion.new)
		else
			anim("You use a health potion")
			$player.heal(20)
		end
	end
end

