class Armour
	
	attr_reader :is_armour, :is_weapon, :defence
	
	def initialize
		@is_armour = true
		@is_weapon = false
	end

	def to_s
		"#{@name}"
	end
end
