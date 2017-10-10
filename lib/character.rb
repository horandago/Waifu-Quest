class Player
	attr_reader :name 
	attr_accessor :hp, :gp, :exp, :weapon

	MAX_HP = 10
		
	def initialize(name)
		@name = name
		@hp = MAX_HP
		@exp = 0
		@gp = 100
		@weapon = $bronze_sword
	end

	def alive?
		@hp > 0
	end

	def attack
		@weapon.send(:dmg)
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
				@weapon = "$#{weapon}"
				puts "You equip #{weapon}"
			else
				puts "You can't wield a #{weapon} you dingus!"
		end
	end	

end

class Mage < Player
	
	def use_mp(amount)
		@mp -= amount
	end
end
