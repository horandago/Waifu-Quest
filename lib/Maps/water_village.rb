class Water_village < Maps

	def initialize
		super
		@name = "Water village"
		@npc = $water_shopkeeper
	end

	def look
		anim("You are in a water village filled with fish people...")
	end

	def map
    $last_village = $water_village
		@move_map = [$lake]
		anim("What do you want to do?")
		puts "-----Water Village-----"
		print_map_choices
		puts "-----------------------"
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
$water_village = Water_village.new
