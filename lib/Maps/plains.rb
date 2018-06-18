class Plains < Maps

	def initialize
		super
		@name = "Plains"
	end

	def look
		anim("Flat green plains with a pleasant stone path")
	end

	def map
		@move_map = [$bridge, $village, $lake, $forest]
		anim("What do you want to do?")
		puts "-----PLAINS-----"
		print_choices
		puts "----------------"
		$player.info
		print "\n: "
		ans = gets.chomp.downcase.capitalize!
		until @choices.include? ans
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
		@monsters_list = [Large_harpy.new, Dryad.new]	
		@enemy = @monsters_list.sample
		wild_action(ans, @enemy)
	end
end
$plains = Plains.new
