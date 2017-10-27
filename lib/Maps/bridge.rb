class Bridge < Maps

	def initialize
		super
		@name = "Bridge"
	end

	def look
		if $bandit_queen.alive?
			anim("A long bridge over a river being guarded by a strong looking bandit")
		else
			anim("A long rickety bridge over a deep river")
		end
	end

	def map
		@choices = ["Look",
					"Fight",
					"Item",
					"Equip",
					"Move"
					]
			@move_map = [$fields
					]
		if $map.level > 1
			@move_map.push($plains)
		end
		anim("What do you want to do?")
		puts "-----BRIDGE-----"
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
			if $bandit_queen.alive?
				anim("Bandit Queen: \"Stop right there! Pay a fine or be gone!\"")
				anim("Bandit Queen: \"500gp if you don't mind!!\"")
				$game.continue
				anim("What do you do?:")
				puts "-----\nPay\nFight\n-----"
				ans = gets.chomp.downcase
				case ans
					when "pay" then
						anim("(Of course you won't actually pay this...)")
					when "fight" then
					anim("You encounter the queen of the bandits!")
					$bandit_queen.hp = 15
					$bandit_queen.fight
				end
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
$bridge = Bridge.new
