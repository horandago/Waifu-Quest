class Maps
	attr_reader :name, :move_map

	def initialize
	end

	def to_s
		"#{@name}"
	end

	def inventory
		anim("Use an item?")
		ans = gets.chomp.downcase
		$inventory.use_item(ans)
	end

	def equip
		$inventory.list_equipment
		equip = gets.chomp.downcase
		$player.equip(equip)
	end

	def move
		new_map = Hash.new
		self.move_map.each {|obj| new_map[obj] = obj.to_s}
		anim("Where would you like to go?:")
		puts "----------"
		new_map.each {|k,v| puts v}
		puts "---------"
		ans = gets.chomp.downcase.capitalize!
		if ans != "Exit"
			new_map.each {|k,v|	if ans == v
			$game.current_map = k
			anim("You move to: #{v}")
			end
			}
		elsif ans == "Exit"
			return $game.current_map.map			
		else
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
	end

	def rest
		anim("You take a rest in the village's inn\nYou restore your hp!")
		$player.hp = $player.max_hp
    	$game.continue
	end
end
