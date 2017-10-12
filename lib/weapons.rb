class Weapons
	attr_reader :is_weapon
	def to_s
		"#{@name}"
	end

	def dmg
		rand(@dmg_lo...@dmg_hi)
	end
	
end
