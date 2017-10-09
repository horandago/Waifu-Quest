class Fists < Weapon
	:is_weapon
	def initialize
		super
		@dmg_hi = 1
		@dmg_lo = 0
	end
	
	def description
		anim("Your bare hands, not bear hands")
	end
end
