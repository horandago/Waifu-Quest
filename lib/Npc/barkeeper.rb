require_relative '../npc.rb'

class Barkeeper < Npc
attr_reader :deny
			ALE_COST = 10
	 
	def initialize
			@@shop_list = ['Ale', 'Exit']
	    @deny = "Barkeeper: Geeee aaaat ya god damn droonk!"
	end

	def speak
		@dialogue = ["VL1","VL2","VL3"]
		anim("#{@dialogue.sample}")
	end

	def shop
		anim("Wa can ee get fur yuu?")
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
			puts "Ale - #{ALE_COST}gp"
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
				when 'Ale' 	
					$inventory.buy(Ale.new, self)
			end
		elsif ans == "sell"
			anim("Barkeeper: \"This ere be a fookin poob ya dingus!!\"\n\"We dern wun yer\"\n...\n...\n\"yer\"\n..\n\"fookin ell\"\n...\nThe bar keeper is way too drunk to deal with sales")
		elsif ans == "exit"
			break
		end
	end
end
end

$barkeeper = Barkeeper.new
