require_relative '../npc.rb'

class Water_shopkeeper < Npc
			POTION_COST = 25
			MALLET_COST = 200
			MAIL_COST = 50
	def initialize
			@@shop_list = ['Good potion', 'Mallet', 'Chainmail', 'Exit']
	end

	def speak
		if $hydra.alive?
			anim("Shopkeeper: *shrieks in fish language*")
			anim("Shopkeeper: \"Please help us! The hydra has scared off any merchants! We're all going to die *glub glub*!\"")
			anim("(You get the feeling you need to defeat the hydra first...)")
		else
			anim("Hello #{$player.name}!\nWhat are you looking for today?")
			loop do
			puts "----------"
			puts "Buy\nSell\nExit"
			puts "----------"
      puts "#{$player.name}: #{$player.gp}gp"
			ans = gets.chomp.downcase
			until ans == "buy" || ans == "sell" || ans == "exit"
				ans = gets.chomp.downcase
			end
			if ans == "buy"
				puts "----------"
				puts "Good Potion - #{POTION_COST}gp"
				puts "Mallet - #{MALLET_COST}gp"
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
				when 'Good potion' 	
					if $player.gp >= 25
						puts "You purchase the potion for #{POTION_COST}gp!".colorize(:green)
            $game.continue
						$inventory.add_item(Good_potion.new)
						$player.gp -= POTION_COST
					else
						anim("Shopkeeper: Yerp, if yer canny afford that, you got not business here I'm afraid")
					end
				when 'Mallet'
 	     			if $player.gp >= 200
 	       			puts "You purchase the bronze sword for #{MALLET_COST}gp!".colorize(:green)
              $game.continue
 	       			$inventory.add_item(Mallet.new)
 	       			$player.gp -= MALLET_COST
 	     			else
 	       			anim("Shopkeeper: Gotta spend a bit more than that!")
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
end

$water_shopkeeper = Water_shopkeeper.new
