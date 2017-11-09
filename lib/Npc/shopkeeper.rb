require_relative '../npc.rb'

class Shopkeeper < Npc
			POTION_COST = 10
			SWORD_COST = 35
			MAIL_COST = 50
	def initialize
			@@shop_list = ['Potion', 'Bronze sword', 'Chainmail', 'Exit']
      @deny = "Shopkeeper: Take your peasant money elsewhere!"
	end

	def speak
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
				$inventory.buy(Potion.new, self)
			when 'Bronze sword'
			  $inventory.buy(Bronze_sword.new, self)
      when 'Chainmail'
      	$inventory.buy(Chainmail.new, self)
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
