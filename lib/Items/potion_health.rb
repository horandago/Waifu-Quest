require_relative '../items.rb'

class Potion_hp < Item
	def initialize
		super
		@is_usable = true
	end

	def self.use
		puts "You use a health potion\nYou gain 5hp!"
		$player.heal(5)
	end
end

