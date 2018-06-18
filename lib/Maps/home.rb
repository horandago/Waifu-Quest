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
    $last_village = $home
  	@move_map = [$fields]
		anim("What do you want to do?")
		puts "-----Home-----"
		print_map_choices
		puts "--------------"
		$player.info
		print "\n: "
		ans = gets.chomp.downcase.capitalize!
		until @map_choices.include? ans
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
    self.home_action(ans, @npc)
	end
end

$home = Home.new
