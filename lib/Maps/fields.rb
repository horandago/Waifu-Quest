class Fields < Maps

	def initialize
		super
		@monsters_list = [Harpy.new]	
		@name = "Fields"
	end

	def map
	@choices = ["Look",
							"Fight",
							"Inventory",
							"Equip",
							"Character"
						 ]
		anim("What do you want to do?")
		puts "----------"
		puts @choices
		puts "----------"
		ans = gets.chomp.downcase.capitalize!
		until @choices.include? ans
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
		case ans
			when "Character" then $player.info
			when "Inventory" then $inventory.list_items
				puts "exit"
				anim("Use an item?")
				ans = gets.chomp.downcase
				$inventory.use_item(ans)
			when "Fight" then
				@enemy = @monsters_list.sample
				@enemy.fight
			when "Equip" then
				anim("What do you want to equip?")
				$inventory.list_equipment
				puts "exit"
				equip = gets.chomp.downcase
				$player.equip(equip)
		end
	end

end

$fields = Fields.new
