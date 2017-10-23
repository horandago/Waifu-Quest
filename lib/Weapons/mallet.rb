class Mallet < Weapons
	:is_weapon
	
	def initialize
		super
		@name = "Mallet"
		@dmg_lo = 4
		@dmg_hi = 6
		@value = 35
	end

	def description
		anim("A sturdy iron mallet")
	end
end

