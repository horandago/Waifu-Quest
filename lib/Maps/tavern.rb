class Tavern < Maps

	def initialize
		super
		@name = "Tavern"
    @npc = $barkeeper	
		@choices = ["Look",
								"Talk",
								"Shop",
								"Move",
								"Info"
								]
	end

	def look
		anim("You are in a busy, rustic looking tavern full of surprisingly sober people")
	end

	def map
		@move_map = [$village]
		anim("What do you want to do?")
		puts "-----#{@name}-----"
		@choices.each {|k| puts "> #{k}".colorize(:green)}
		puts "-----------------"
		$player.info
		print "\n: "
		ans = gets.chomp.downcase.capitalize!
		until @choices.include? ans
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
		case ans
			when "Look"
				self.look
			when "Talk"
				@npc.speak
			when "Shop"
				@npc.shop
			when "Move"
				self.move
			when "Info"
				$player.character
		end
	end
end
$tavern = Tavern.new
