class Hut < Maps

	def initialize
		super
		@name = "Hut"
	end

	def look
			anim("A shabby old hut this far into the deep forest...?")
	end

	def map
		@choices = ["Look",
          "Talk",
					"Fight",
					"Item",
					"Equip",
					"Move"
					]
			@move_map = [$forest]
		anim("What do you want to do?")
		puts "-----HUT-----"
		puts @choices
		puts "-------------"
		$player.info
		print "\n: "
		ans = gets.chomp.downcase.capitalize!
		until @choices.include? ans
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
		
		case ans
		when "Item" then 
			$inventory.list_items
			self.inventory
		when "Talk" then
      $witch.speak
    when "Look" then
			self.look
		when "Equip" then
			self.equip
		when "Move" then
			self.move
		end
	end
end

$hut = Hut.new
