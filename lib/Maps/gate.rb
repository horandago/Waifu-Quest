class Gate < Maps

	def initialize
		super
		@name = "Gate"
		@choices = ["Look",
					"Fight",
					"Item",
					"Equip",
					"Move"
					]
	end

	def look
		if $Wizard.alive?
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
$gate = Gate.new
