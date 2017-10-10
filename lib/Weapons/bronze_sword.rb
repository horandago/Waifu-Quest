class Bronze_sword < Weapons
	:is_weapon
	
	def initialize
		super
		@dmg_hi = 3
		@dmg_lo = 1
	end

	def dmg
		rand(@dmg_lo...@dmg_hi)
	end

def description
		anim("A rutsy short sword made of bronze")
	end
end
$bronze_sword = Bronze_sword.new
