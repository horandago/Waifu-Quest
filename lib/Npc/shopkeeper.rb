require_relative '../npc.rb'

class Shopkeeper < Npc
			POTION_COST = 10
			SWORD_COST = 40
			MAIL_COST = 50
	def initialize
			@@shop_list = ['Potion', 'Bronze sword', 'Chainmail', 'Exit']
	end

	def speak
		anim("Hello #{$player.name}!\nWhat are you looking for today?")
		loop do
		puts "----------"
		puts "Buy\nSell\nExit"
		puts "----------"
		ans = gets.chomp.downcase
		until ans == "buy" || ans == "sell" || ans == "exit"
			ans = gets.chomp.downcase
		end
		if ans == "buy"
			puts "----------"
			puts "Potion - #{POTION_COST}gp"
			puts "Bronze Sword - #{SWORD_COST}gp"
			puts "Chainmail - #{MAIL_COST}gp"
			puts "Exit"
			puts "----------"
			ans = gets.chomp.downcase.capitalize!
			until @@shop_list.include? ans
				puts "Please type that correctly:"
				ans = gets.chomp.downcase.capitalize!
			end
	
			case ans
			when 'Exit'
				return speak
			when 'Potion' 	
				if $player.gp >= 10
					puts "You purchase the potion for #{POTION_COST}gp!"
					$inventory.add_item(Potion.new)
					$player.gp -= POTION_COST
				else
					anim("Shopkeeper: You're too poor to buy a..potion? Begone, peasant!")
				end
			when 'Bronze sword'
      			if $player.gp >= 40
        			puts "You purchase the bronze sword for #{SWORD_COST}gp!"
        			$inventory.add_item(Bronze_sword.new)
        			$player.gp -= SWORD_COST
      			else
        			anim("Shopkeeper: Take your peasant money elsewhere!")
      			end
			when 'Chainmail'
      			if $player.gp >= 50
        			puts "You purchase the chainmail for #{MAIL_COST}gp!"
        			$inventory.add_item(Chainmail.new)
        			$player.gp -= MAIL_COST
      			else
      	  		anim("Shopkeeper: Take your peasant money elsewhere!")
      			end
			end
		elsif ans == "sell"
			$inventory.list_all_items_price
			anim("Which item will you sell?:")
			ans = gets.chomp.downcase
			$inventory.sell(ans)
		elsif ans == "exit"
			break
		end
	end
end
end

$shopkeeper = Shopkeeper.new
