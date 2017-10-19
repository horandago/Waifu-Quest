class Home < Maps

	def initialize
		super
		@name = "Home"
		@choices = ["Look",
					"Shop",
					"Inventory",
					"Equip",
					"Character",
					"Move"
					]
		@move = [$fields,
				]
	end

	def look
		anim("You are in your home village")
	end

	def map
		anim("What do you want to do?")
		puts "----------"
		puts @choices
		puts "----------"
		ans = gets.chomp.downcase.capitalize!
		until @choices.include? ans
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
		case ans
			when "Character" then 
				$player.info
			when "Inventory" then 
				$inventory.list_items
				self.inventory
			when "Shop" then
				$shopkeeper.speak
			when "Look" then
				self.look
			when "Equip" then
				self.equip
			when "Move" then
				self.move
		end
	end
end

$home = Home.new
