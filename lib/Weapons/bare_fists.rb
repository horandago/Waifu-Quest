class Bare_fists < Weapons
	def initialize
		super
		@dmg_hi = 2
		@dmg_lo = 0
		@name = "Bare fists"
	end
	
	def dmg
		rand(@dmg_lo...@dmg_hi)
	end

	def description
		anim("Your bare hands, not bear hands")
	end
end

$bare_fists = Bare_fists.new
