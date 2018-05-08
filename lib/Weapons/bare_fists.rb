class Bare_fists < Weapons
	def initialize
		super
		@dmg_lo = 1
		@dmg_hi = 2
		@name = "Bare fists"
		@price = 10 
		@is_sellable = false
	end
	
	def dmg
		rand(@dmg_lo...@dmg_hi)
	end

	def description
		anim("Your bare hands, not bear hands")
	end
end

