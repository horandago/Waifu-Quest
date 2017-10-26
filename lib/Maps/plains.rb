class Plains < Maps

	def initialize
		super
		@name = "Plains"
		@choices = ["Look",
					"Fight",
					"Item",
					"Equip",
					"Move"
					]
	end

	def look
		anim("Flat green plains with a pleasant stone path")
	end

	def map
		@move_map = [$bridge, $village, $lake]
		anim("What do you want to do?")
		puts "-----PLAINS-----"
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
			@monsters_list = [Large_harpy.new]	
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
$plains = Plains.new
