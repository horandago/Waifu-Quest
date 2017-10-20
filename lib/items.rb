
class Items
	attr_reader :is_usable, :value, :is_item, :is_equipment, :is_armour, :is_weapon, :is_sellable
	def initialize
		@is_usable = true
		@is_item = true
		@is_armour = false
		@is_weapon = false
		@is_equipment = false
		@is_sellable = true
	end

	def to_s
		"#{@name}"
	end

end

