class Cave < Maps

	def initialize
		super
		@name = "Cave"
		
	end

	def look
		anim("A very dark cave with a chilling wind")
	end

	def map
		@move_map = [$fields
					]
		anim("What do you want to do?")
		puts "-----CAVE-----"
		puts @choices
		puts "--------------"
		$player.info
		print "\n: "
		ans = gets.chomp.downcase.capitalize!
		until @choices.include? ans
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
	  @monsters_list = [Slime.new]
    @enemy = @monsters_list.sample	
    wild_action(ans, @enemy)
	end
end
$cave = Cave.new
