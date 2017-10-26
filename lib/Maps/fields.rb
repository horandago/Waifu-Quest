class Fields < Maps

	def initialize
		super
		@name = "Fields"
	end

	def look
		anim("The green fields stretch out as far as you can see")
	end

	def map
		@choices = ["Look",
					"Fight",
					"Item",
					"Equip",
					"Move"
					]
		@move_map = [$home, $cave, $mountains, $bridge]
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
		when "Item" then 
			$inventory.list_items
			self.inventory
		when "Fight" then
			@monsters_list = [Harpy.new, Mouse.new]	
			@enemy = @monsters_list.sample
			anim("You encounter the #{@enemy.name}!")
			@enemy.fight
		when "Look" then
			self.look
		when "Equip" then
			self.equip
		when "Move" then
			move
		end
	end

end
$fields = Fields.new
