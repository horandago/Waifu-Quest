class Armour
	
	attr_reader :is_armour, :is_weapon, :defence, :value, :is_item, :is_usable, :is_equipment, :is_sellable, :is_junk
	
	def initialize
		@is_armour = true
		@is_weapon = false
		@is_equipment = true
		@is_item = false
		@is_usable = false
		@is_sellable = true
    @is_junk = false
	end

	def to_s
		"#{@name}"
	end
end
