class Mallet < Weapons
	:is_weapon
	
	def initialize
		super
		@name = "Mallet"
		@dmg_hi = 6
		@dmg_lo = 4
	end

	def description
		anim("A sturdy iron mallet")
	end
end

