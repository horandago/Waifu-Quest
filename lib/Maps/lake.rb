class Lake < Maps

	def initialize
		super
		@name = "Lake"
	end

	def look
		anim("A large, but shallow lake where you can barely see a path run through")
	end

	def map
		@move_map = [$plains, $water_village, $waters]
		anim("What do you want to do?")
		puts "-----LAKE-----"
		puts @choices
		puts "--------------"
		$player.info
		print "\n: "
		ans = gets.chomp.downcase.capitalize!
		until @choices.include? ans
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
		@monsters_list = [Frog_girl.new, Mermaid.new]	
		@enemy = @monsters_list.sample
		wild_action(ans, @enemy)
	end
end
$lake = Lake.new
