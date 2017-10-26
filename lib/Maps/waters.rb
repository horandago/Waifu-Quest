class Waters < Maps

	def initialize
		super
		@name = "Waters"
	end

	def look
		if $hydra.alive?
			anim("A very very dark, deep lake. The water is moving around...")
		else
			anim("A very very dark, deep lake. It is still.")
		end
	end

	def map
		@choices = ["Look",
					"Fight",
					"Item",
					"Equip",
					"Move"
					]
			@move_map = [$lake
					]
#		if $map.level > 1
#			@move_map.push()
#		end
		anim("What do you want to do?")
		puts "-----WATERS-----"
		puts @choices
		puts "----------------"
		$player.info
		print "\n: "
		ans = gets.chomp.downcase.capitalize!
		until @choices.include? ans
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
		
		case ans
		when "Item" then 
			$inventory.list_items
			self.inventory
		when "Fight" then
			if $hydra.alive?
#				anim("Bandit Queen: \"Stop right there! Pay a fine or be gone!\"")
#				anim("Bandit Queen: \"500gp if you don't mind!!\"")
#				$game.continue
				anim("You encounter the Hydra!")
				$hydra.hp = 35
				$hydra.fight
			else
				anim("Any other forms of life have left here a long time ago")
			end
		when "Look" then
			self.look
		when "Equip" then
			self.equip
		when "Move" then
			self.move
		end
	end

end
$waters = Waters.new
