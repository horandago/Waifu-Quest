class Maps
	attr_reader :name

	def initialize
	end

	def to_s
		"#{@name}"
	end

	def inventory
		puts "exit"
		anim("Use an item?")
		ans = gets.chomp.downcase
		$inventory.use_item(ans)
	end

	def equip
		$inventory.list_equipment
		puts "exit"
		equip = gets.chomp.downcase
		$player.equip(equip)
	end

	def move
		puts $game.current_map.name
		new_map = Hash.new
		@move.each {|obj| new_map[obj] = obj.to_s}
		anim("Where would you like to go?:")
		puts "----------"
		new_map.each {|k,v| puts v}
		puts "---------"
		puts new_map.inspect
		ans = gets.chomp.downcase.capitalize!
			if ans != "Exit"
				puts "in if statement"
				new_map.each {|k,v|	if ans == v
				$game.current_map = k
				anim("You move to: #{v}")
				end
				break
				}
			elsif ans == "Exit"
				return $game.current_map.map			
			else
				puts "Please type that correctly"
				ans = gets.chomp.downcase.capitalize!
			end
	end
end
