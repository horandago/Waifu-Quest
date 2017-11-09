class Dark_blade < Weapons
	:is_weapon
	
	def initialize
		super
		@name = "Dark blade"
		@dmg_lo = 10
		@dmg_hi = 15
		@price = 500
	end

	def description
		anim("The most powerful blade in existence!!!")
	end
end

