class Bronze_sword < Weapons
	
	def initialize
		super
		@name = "Bronze sword"
		@dmg_lo = 1
		@dmg_hi = 4
		@price = 12
	end

	def description
		anim("A rutsy short sword made of bronze")
	end
end

