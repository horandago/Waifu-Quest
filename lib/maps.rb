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
		anim("What do you want to equip?")
		$inventory.list_equipment
		puts "exit"
		equip = gets.chomp.downcase
		$player.equip(equip)
	end

	def move
		anim("Where would you like to go?:")
		puts "----------"
		@move.each {|a| puts a.to_s}
		puts "---------"
		new_map = Hash.new
		@move.each {|obj| new_map[obj] = obj.to_s}
		ans = gets.chomp.downcase.capitalize!
		loop do
			if ans != "Exit"
				new_map.each {|k,v|	if ans == v
				$game.current_map = k
				anim("You move to: #{v}")
				return $game.play_game
				end						
				}
			end
			if ans == "Exit"
				return $game.current_map.map			
			else
				puts "Please type that correctly"
				ans = gets.chomp.downcase.capitalize!
			end
		end
	end
end
