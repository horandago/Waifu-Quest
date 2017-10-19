class Monster
	attr_reader :hp, :name, :attack, :exp, :gold_lo, :gold_hi, :items
	def initialize
	end

	def alive?
		@hp > 0
	end

	def hurt(amount)
		@hp -= amount
		puts "Monster takes #{amount} damage!"
	end

  def drop
		@drop_item = items.sample
		@drop_gold = rand(@gold_lo...@gold_hi)	
		@grammar = "1 "
		unless @drop_item == "nothing"
			$inventory.add_item(@drop_item)
			@grammar = ""
		end
		$player.gp += @drop_gold
		anim("The #{self.name} dropped #{@grammar}#{@drop_item.to_s} and #{@drop_gold}gp!")
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
			self.hurt($player.attack)
			puts "#{self.name} attacks you!"
			if self.hp < 1
				anim("You defeated the #{self.name.capitalize}!")
				$player.exp(exp)
				self.drop
				break
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


