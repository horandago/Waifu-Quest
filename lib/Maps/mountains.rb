class Mountains < Maps

	def initialize
		super
		@name = "Mountains"
		
	end

	def look
		anim("Steep rocky mountains without an end in sight...")
	end

	def map
		@move_map = [$fields]
		if $map.level > 1
      @move_map.push($path)
    end
		anim("What do you want to do?")
		puts "-----MOUNTAINS-----"
		print_choices
		puts "-------------------"
		$player.info
		print "\n: "
		ans = gets.chomp.downcase.capitalize!
		until @choices.include? ans
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
		@monsters_list = [Rock_beetle.new]	
		@enemy = @monsters_list.sample
    wild_action(ans, @enemy)		
	end
end

$mountains = Mountains.new
