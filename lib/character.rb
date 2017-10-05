class Player
	attr_reader :name, :hp

	MAX_HP = 10
	
	def initialize(name)
		@name = name
		@hp = MAX_HP
		@exp = 0
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
end

class Mage < Player
	
	def use_mp(amount)
		@mp -= amount
	end

end
