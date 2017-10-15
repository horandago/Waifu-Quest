require_relative '../items.rb'

class Potion < Items
	def initialize
		super
		@name = "Potion"
	end

	def use
		if $player.hp == $player.max_hp
			anim("You are already at full HP!")
			$inventory.add_item(Potion.new)
		else
			anim("You use a health potion")
			$player.heal(5)
		end
	end
end

