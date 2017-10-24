class Path < Maps

	def initialize
		super
		@name = "Path"
		@choices = ["Look",
					"Fight",
					"Item",
					"Equip",
					"Move"
					]
		
	end

	def look
		anim("A narrow path on the edge of a cliff. It's getting rather hot...")
	end

	def map
		@move_map = [$mountains]
		anim("What do you want to do?")
		puts "-----PATH-----"
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
			@monsters_list = [Fire_slime.new]	
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
$path = Cave.new
