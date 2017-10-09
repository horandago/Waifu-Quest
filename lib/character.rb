class Player
	attr_accessor :name, :hp, :gp, :exp

	MAX_HP = 10
	
	
	def initialize(name)
		@name = name
		@hp = MAX_HP
		@exp = 0
		@gp = 100
	end

	def alive?
		@hp > 0
	end

	def hurt(amount)
		@hp -= amount
		puts "You take #{amount} damage!"
	end

	def heal(amount)
		@hp += amount
		@hp - [@hp, MAX_HP].min
	end

	def exp(gain)
		@exp += gain
		puts "You gained #{gain} exp!"
	end

	def equip_weapon(weapon)
			if weapon.is_weapon?
				puts "Weapon is weapon"
			else
				puts "probably a syntax error"
		end
	end	

end

class Mage < Player
	
	def use_mp(amount)
		@mp -= amount
	end
end
