class Mallet < Weapons
	:is_weapon
	
	def initialize
		super
		@name = "Mallet"
		@dmg_lo = 6
		@dmg_hi = 10
		@value = 100
	end

	def description
		anim("A sturdy iron mallet")
	end
end

