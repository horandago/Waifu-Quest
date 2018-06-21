class Village < Maps

	def initialize
		super
		@name = "Village"
    @npc = $village_shopkeeper	
	end

	def look
		anim("You are in a pleasant farming village")
	end

	def map
    $last_village = $village
		@move_map = [$plains, $tavern]
		anim("What do you want to do?")
		puts "-----Village-----"
		print_map_choices
		puts "-----------------"
		$player.info
		print "\n: "
		ans = gets.chomp.downcase.capitalize!
		until @map_choices.include? ans
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
    home_action(ans, @npc)
	end
end
$village = Village.new
