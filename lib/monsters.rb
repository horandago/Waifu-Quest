class Monster
	attr_reader :hp
	def initialize
	end

	def alive?
		@hp > 0
	end

	def hurt(amount)
		@hp -= amount
		puts "Monster takes #{amount} damage!"
	end

	def fight
		
		
	while $player.alive?
		puts "You encounter the #{@name}!"
		puts "What do you want to do?"
		puts "----\nfight\n----"
		ans = gets.chomp.downcase
		self.hurt(1)
		puts "Monster attacks you!"
		if self.hp < 1
			puts "monster be deead"
			$player.exp(10)
			return true
		end 	
		$player.hurt(1)
end	
end
end

class Harpy < Monster
	def initialize
		super
		@hp = 5
		@name = "Harpy"
end
end

$harpy = Harpy.new
$monster = Monster.new

