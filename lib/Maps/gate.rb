class Gate < Maps

	def initialize
		super
		@name = "Gate"
	end

	def look
		if $wizard.alive?
			anim("A large gate covered in ivy...you sense a foul magic here")
		else
			anim("A large open gate leading towards darkness...")
		end
	end

	def map
			@move_map = [$forest
					]
		if $map.level > 2
			@move_map.push($dark_path)
		end
		anim("What do you want to do?")
		puts "-----GATE-----"
		puts @choices
		puts "--------------"
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
		when "Fight" then
			if $wizard.alive?
					$wizard.hp = 40
					$wizard.fight
			else
				anim("You have already reclaimed the bridge!")
			end
		when "Look" then
			self.look
		when "Equip" then
			self.equip
		when "Move" then
			self.move
		end
	end

end
$gate = Gate.new
