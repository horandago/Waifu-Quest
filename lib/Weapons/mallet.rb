class Mallet < Weapons
	:is_weapon
	
	def initialize
		super
		@name = "Mallet"
		@dmg_lo = 4
		@dmg_hi = 6
		@value = 100
	end

	def description
		anim("A sturdy iron mallet")
	end
end

