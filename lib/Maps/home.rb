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
	end

	def look
		anim("You are in your home village")
	end

	def map
		@move = [Fields.new
						]
	puts $game.inspect
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
			when "Character" then $player.info
			when "Inventory" then $inventory.list_items
				puts "exit"
				anim("Use an item?")
				ans = gets.chomp.downcase
				$inventory.use_item(ans)
			when "Shop" then
				$shopkeeper.speak
			when "Look" then
				self.look
			when "Equip" then
				anim("What do you want to equip?")
				$inventory.list_equipment
				puts "exit"
				equip = gets.chomp.downcase
				$player.equip(equip)
			when "Move" then
				anim("Where would you like to go?:")
				puts "----------"
				@move.each {|a| puts a.to_s}
				puts "---------"
				new_map = Hash.new
				@move.each {|obj| new_map[obj] = obj.to_s}
				ans = gets.chomp.downcase.capitalize!
				loop do
					if ans != "Exit"
						new_map.each {|k,v|	if ans == v
							$game.current_map = k
							anim("You move to: #{v}")
							return $game.play_game
						end						
					}
					end
					if ans == "Exit"
						return $game.current_map.map			
					else
						puts "Please type that correctly"
						ans = gets.chomp.downcase.capitalize!
				end
			end
		end
	end
end

$home = Home.new
