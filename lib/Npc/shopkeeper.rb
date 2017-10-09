require_relative '../npc.rb'

class Shopkeeper < Npc
			POTION_COST = 10
			SWORD_COST = 50
	def initialize
			@@shop_list = ['Potion', 'Bronze sword', 'Exit']
	end

	def speak
		anim("Hello #{$player.name}!\nWhat are you looking for today?")
		loop do
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
			anim("Shopkeeper: Goodbye, young adventurer!")
			return true
		when 'Potion' 	
			if $player.gp >= 10
				anim("You purchase the potion for #{POTION_COST}gp")
				$inventory.add_item('Potion')
				$player.gp -= 10
			else
				anim("Shopkeeper: You're too poor to buy a..potion? Begone, peasant!")
			end
		end	
		anim("You purchased the #{ans}")
	end
	end
end


$shopkeeper = Shopkeeper.new
