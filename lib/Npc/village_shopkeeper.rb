require_relative '../npc.rb'

class Village_shopkeeper < Npc
			POTION_COST = 25
			MALLET_COST = 150
			MAIL_COST = 50
			ROPE_COST = 10
      @deny = "Shopkeeper: Yerp, if yer canny afford that, you got not business here I'm afraid"
	def initialize
			@@shop_list = ['Good potion', 'Mallet', 'Rope', 'Chainmail', 'Exit']
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
			puts "Good Potion - #{POTION_COST}gp"
			puts "Mallet - #{MALLET_COST}gp"
			puts "Chainmail - #{MAIL_COST}gp"
      puts "Rope - #{ROPE_COST}gp"
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
					$inventory.buy(Good_potion.new, self)
    			when 'Rope'  
        			$inventory.buy(Rope.new, self)		
    			when 'Mallet'
      				$inventory.buy(Mallet.new, self)
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

$village_shopkeeper = Village_shopkeeper.new
