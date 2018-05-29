class Dark_path < Maps

	def initialize
		super
		@name = "Dark_path"
		
	end

	def look
		anim("A long and dark winding path drenched in mist...")
	end

	def map
		@move_map = [$gate]
		anim("What do you want to do?")
		puts "-----DARK PATH-----"
		puts @choices
		puts "-------------------"
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
$dark_path = Dark_path.new
