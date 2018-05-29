class Helmet
	
	attr_reader :is_helmet, :is_armour, :is_weapon, :defence, :price, :is_item, :is_usable, :is_equipment, :is_sellable, :is_junk
	
	def initialize
		@is_armour = false
    @is_helmet = true
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
