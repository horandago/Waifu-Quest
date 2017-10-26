class Village < Maps

	def initialize
		super
		@name = "Village"
		
	end

	def look
		anim("You are in a pleasant farming village")
	end

	def map
		@choices = ["Look",
					"Shop",
					"Item",
					"Equip",
					"Move",
					"Rest",
		      "#{$player.name}"
    			]
    $last_village = $village
		@move_map = [$plains]
		anim("What do you want to do?")
		puts "-----Village-----"
		puts @choices
		puts "-----------------"
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
			when "Shop" then
				$village_shopkeeper.speak
			when "Look" then
				self.look
			when "Equip" then
				self.equip
			when "Move" then
				self.move
			when "Rest" then
				self.rest
      when "#{$player.name}" then
        $player.character
		end
	end
end
$village = Village.new
