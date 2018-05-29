class Home < Maps

	def initialize
		super
		@name = "Home"
    @npc = $shopkeeper		
	end

	def look
		anim("You are in your home village")
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
    $last_village = $home
  	@move_map = [$fields]
		anim("What do you want to do?")
		puts "-----HOME-----"
		puts @choices
		puts "--------------"
		$player.info
		print "\n: "
		ans = gets.chomp.downcase.capitalize!
		until @choices.include? ans
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
    self.home_action(ans, @npc)
	end
end

$home = Home.new
