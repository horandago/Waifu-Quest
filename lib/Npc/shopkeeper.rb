require_relative '../npc.rb'

class Shopkeeper < Npc
			POTION_COST = 10
			SWORD_COST = 50
	def initialize
			@@shop_list = ['Potion', 'Bronze sword', 'Exit']
	end

	def speak
		puts "Hello #{$player.name}!\nWhat are you looking for today?"
		puts "----------"
		puts "Potion - #{POTION_COST}gp"
		puts "Bronze Sword - #{SWORD_COST}gp"
		puts "Exit"
		puts "----------"
		ans = gets.chomp.downcase.capitalize!
		until @@shop_list.include? ans
			puts "Please type that correctly:"
			ans = gets.chomp.downcase.capitalize!
		end
	
		case ans
		when 'Exit'
			puts "Shopkeeper: Goodbye, young adventurer!"
			return true
		when 'Potion' 	
			if $player.gp >= 10
				puts "You purchase the potion for #{POTION_COST}gp"
				$inventory.add_item('potion')
				$player.gp -= 10
			else
				puts "Shopkeeper: You're too poor to buy a..potion? Begone, peasant!"
			end
		end	
		puts "You purchased the #{ans}"
	end
end


$shopkeeper = Shopkeeper.new
