class Bronze_sword < Weapons
	
	def initialize
		super
		@name = "Bronze sword"
		@dmg_hi = 4
		@dmg_lo = 1
	end

	def description
		anim("A rutsy short sword made of bronze")
	end
end

$bronze_sword = Bronze_sword.new
