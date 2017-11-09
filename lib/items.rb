
class Items
	attr_reader :is_usable, :price, :is_item, :is_equipment, :is_armour, :is_weapon, :is_sellable, :is_junk, :is_usable_battle, :is_usable_multiple
	def initialize
		@is_usable = true
		@is_item = true
		@is_armour = false
		@is_weapon = false
		@is_equipment = false
		@is_sellable = true
		@is_junk = false
    @is_usable_battle = false
    @is_usable_multiple = false
	end

	def use
		if self.is_junk
			anim("You cannot use this item..")
		end
	end

	def to_s
		"#{@name}"
	end

end

