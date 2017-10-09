class Monster
	attr_reader :hp, :name, :attack
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
		puts "HP: #{$player.hp} | #{self.name}: #{self.hp}"
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
		$player.hurt(self.attack)
end	
end
end


