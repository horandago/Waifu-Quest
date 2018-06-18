class Hut < Maps

	def initialize
		super
		@name = "Hut"
    @npc = $witch
	end

	def look
			anim("A shabby old hut this far into the deep forest...?")
	end

	def map
	  @move_map = [$forest]
		anim("What do you want to do?")
		puts "-----HUT-----"
		print_map_choices
		puts "-------------"
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

$hut = Hut.new
