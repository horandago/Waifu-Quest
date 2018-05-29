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
		@choices = ["Look",
					"Shop",
					"Item",
					"Equip",
					"Move",
					"Rest",
		      "#{$player.name}"
    			]
    $last_village = $village
		@move_map = [$plains]
		anim("What do you want to do?")
		puts "-----Village-----"
		puts @choices
		puts "-----------------"
		$player.info
		print "\n: "
		ans = gets.chomp.downcase.capitalize!
		until @choices.include? ans
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
    home_action(ans, @npc)
	end
end
$village = Village.new
