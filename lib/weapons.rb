class Weapons
	attr_reader :is_weapon, :is_armour
	def initialize
		@is_weapon = true
		@is_armour = false
	end

	def to_s
		"#{@name}"
	end

	def dmg
		rand(@dmg_lo...@dmg_hi)
	end
	
end
