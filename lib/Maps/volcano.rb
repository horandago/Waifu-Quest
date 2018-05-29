class Volcano < Maps

	def initialize
		super
		@name = "Volcano"
	end

	def look
		if $lava_golem.alive?
			anim("A menacing volcano housing an enormous lava golem")
		else
			anim("A raging volcano with lava spurting out everywhere")
		end
	end

	def map
			@move_map = [$path
					]
		anim("What do you want to do?")
		puts "-----VOLCANO-----"
		puts @choices
		puts "----------------"
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
			if $lava_golem.alive?
				anim("You encounter the Lava Golem!")
				$lava_golem.hp = 50
				$lava_golem.fight
			else
				anim("It's too hot for much else to survive here!")
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
$volcano = Volcano.new
