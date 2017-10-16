class Armour
	
	attr_reader :is_armour, :is_weapon, :defence, :value, :is_item, :is_usable, :is_equipment
	
	def initialize
		@is_armour = true
		@is_weapon = false
		@is_equipment = true
		@is_item = false
		@is_usable = false
	end

	def to_s
		"#{@name}"
	end
end
