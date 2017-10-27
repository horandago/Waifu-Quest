class Lake < Maps

	def initialize
		super
		@name = "Lake"
	end

	def look
		anim("A large, but shallow lake where you can barely see a path run through")
	end

	def map
		@choices = ["Look",
					"Fight",
					"Item",
					"Equip",
					"Move"
					]
		@move_map = [$plains, $water_village, $waters]
		anim("What do you want to do?")
		puts "-----LAKE-----"
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
			@monsters_list = [Frog_girl.new, Mermaid.new]	
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
$lake = Lake.new
