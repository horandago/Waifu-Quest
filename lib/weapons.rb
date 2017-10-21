class Weapons
	attr_reader :is_weapon, :is_armour, :value, :is_item, :is_equipment, :is_usable, :is_sellable
	def initialize
		@is_weapon = true
		@is_armour = false
		@is_equipment = true
		@is_item = false
		@is_usable = false
		@is_sellable = true
	end

	def to_s
		"#{@name}"
	end

	def dmg
		rand(@dmg_lo...@dmg_hi)
	end
	
end
