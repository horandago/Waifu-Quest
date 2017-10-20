class Fields < Maps

	def initialize
		super
		@monsters_list = [Harpy.new]
		@name = "Fields"
		@choices = ["Look",
					"Fight",
					"Inventory",
					"Equip",
					"Move"
					]
		@move = [$home,
				]
	end

	def look
		anim("The green fields stretch out as far as you can see")
	end

	def map
		anim("What do you want to do?")
		puts "-----FIELDS-----"
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
			@enemy.fight
			@monsters_list = [Harpy.new]	
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

$fields = Fields.new
