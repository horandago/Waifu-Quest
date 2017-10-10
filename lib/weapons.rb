class Weapons
	attr_reader :is_weapon
	def equip(equip)
		$player.weapon = equip
	end
end
