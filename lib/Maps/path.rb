class Path < Maps

	def initialize
		super
		@name = "Path"
		
	end

	def look
		anim("A narrow path on the edge of a cliff. It's getting rather hot...")
	end

	def map
		@move_map = [$mountains, $volcano]
		anim("What do you want to do?")
		puts "-----PATH-----"
		print_choices
		puts "--------------"
		$player.info
		print "\n: "
		ans = gets.chomp.downcase.capitalize!
		until @choices.include? ans
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
		@monsters_list = [Fire_slime.new]	
		@enemy = @monsters_list.sample
		wild_action(ans, @enemy)
	end
end
$path = Path.new
