class Monster
	attr_reader :hp, :name, :attack, :exp
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
		anim("You encounter the #{@name}!")
	while $player.alive?
		puts "HP: #{$player.hp} | #{self.name}: #{self.hp}"
		anim("What do you want to do?")
		puts "----\nFight\nItem\nLook\n----"
		ans = gets.chomp.downcase
		case ans
		when "fight"
			self.hurt(1)
			puts "#{self.name} attacks you!"
			if self.hp < 1
				anim("You defeated the #{self.name.capitalize}!")
				$player.exp(exp)
				return true
			end
		self.action 	
		when "item"
			$inventory.list_items
		when "look"
			self.description
		end
end	
end
end


