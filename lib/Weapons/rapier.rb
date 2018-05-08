class Rapier < Weapons
	:is_weapon
	
	def initialize
		super
		@name = "Rapier"
		@dmg_lo = 2
		@dmg_hi = 6
		@price = 30
	end

	def description
		anim("A super inconsistant rapier")
	end
end

