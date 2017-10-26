class Mountains < Maps

	def initialize
		super
		@name = "Mountains"
		
	end

	def look
		anim("Steep rocky mountains without an end in sight...")
	end

	def map
		@choices = ["Look",
					"Fight",
					"Item",
					"Equip",
					"Move"
					]
		@move_map = [$fields]
		if $map.level > 1
      @move_map.push($path)
    end
		anim("What do you want to do?")
		puts "-----MOUNTAINS-----"
		puts @choices
		puts "-------------------"
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
			@monsters_list = [Rock_beetle.new]	
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

$mountains = Mountains.new
