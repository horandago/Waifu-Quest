class Fields < Maps

	def initialize
		super
		@name = "Fields"
	end

	def look
		anim("The green fields stretch out as far as you can see")
	end

	def map
		@move_map = [$home, $cave, $mountains, $bridge]
		anim("What do you want to do?")
		puts "-----FIELDS-----"
		puts self.choices
		puts "----------------"
		$player.info
		print "\n: "
		ans = gets.chomp.downcase.capitalize!
		until @choices.include? ans
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
		@monsters_list = [Harpy.new, Mouse.new]	
		@enemy = @monsters_list.sample
		wild_action(ans, @enemy)
	end
end
$fields = Fields.new
