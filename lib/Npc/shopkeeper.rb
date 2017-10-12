require_relative '../npc.rb'

class Shopkeeper < Npc
			POTION_COST = 10
			SWORD_COST = 50
	def initialize
			@@shop_list = ['Potion', 'Bronze sword', 'Mallet', 'Exit']
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
				$player.gp -= POTION_COST
			else
				anim("Shopkeeper: You're too poor to buy a..potion? Begone, peasant!")
			end
		when 'Bronze sword'
      if $player.gp >= 50
        anim("You purchase the bronze sword for #{SWORD_COST}gp")
        $inventory.equipment.push(Bronze_sword.new)
        $player.gp -= SWORD_COST
      else
        anim("Shopkeeper: Take your peasant money elsewhere!")
      end
		when 'Mallet'
			anim("You buy a mallet m9")
			$inventory.equipment.push(Mallet.new)
		end	
	end
	end
end


$shopkeeper = Shopkeeper.new
