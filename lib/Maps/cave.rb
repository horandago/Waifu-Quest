class Cave < Maps

	def initialize
		super
		@monsters_list = [Slime.new]
		@name = "Cave"
		@choices = ["Look",
					"Fight",
					"Inventory",
					"Equip",
					"Move"
					]
		@move = [$fields
  	      ]
	end

	def look
		anim("A very dark cave with a chilling wind")
	end

	def map
		anim("What do you want to do?")
		puts "-----CAVE-----"
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
		when "Inventory" then 
			$inventory.list_items
			self.inventory
		when "Fight" then
			@enemy = @monsters_list.sample
			anim("You encounter the #{@enemy.name}!")
			@enemy.fight
			@monsters_list = [Slime.new]	
		when "Shop" then
			$shopkeeper.speak
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
