class Cave < Maps

	def initialize
		super
		@name = "Cave"
		@choices = ["Look",
					"Fight",
					"Item",
					"Equip",
					"Move"
					]
		
	end

	def look
		anim("A very dark cave with a chilling wind")
	end

	def map
		@move_map = [$fields
					]
		anim("What do you want to do?")
		puts "-----CAVE-----"
		puts @choices
		puts "--------------"
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
			@monsters_list = [Slime.new]	
			@enemy = @monsters_list.sample
			anim("You encounter the #{@enemy.name}!")
			@enemy.fight
		when "Look" then
			self.look
		when "Equip" then
			self.equip
		when "Move" then
			self.move
		end
	end

end
$cave = Cave.new
