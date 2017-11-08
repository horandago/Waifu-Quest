class Forest < Maps

	def initialize
		super
		@name = "Forest"
		@choices = ["Look",
					"Fight",
					"Item",
					"Equip",
					"Move"
					]
	end

	def look
		anim("A dark forest with a very ominous air about it...")
	end

	def map
		@move_map = [$plains, $gate]
    if $inventory.items.include? $secret_map
      @move_map.push($hut)
    end
		anim("What do you want to do?")
		puts "-----FOREST-----"
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
			@monsters_list = [Giant_spider.new]	
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
$forest = Forest.new
