Dir["*.rb"].each { |file| require_relative file }
Dir["Monsters/*.rb"].each { |file| require_relative file }
Dir["Npc/*.rb"].each { |file| require_relative file }
Dir["Item/*.rb"].each { |file| require_relative file }
Dir["Weapons/*.rb"].each { |file| require_relative file }
Dir["Armour/*.rb"].each { |file| require_relative file }


system("clear")
puts "

 __      __  _____  .__________________ ___  ________   ____ ______________ ____________________
/  \\    /  \\/  _  \\ |   \\_   _____/    |   \\ \\_____  \\ |    |   \\_   _____//   _____/\\__    ___/
\\   \\/\\/   /  /_\\  \\|   ||    __) |    |   /  /  / \\  \\|    |   /|    __)_ \\_____  \\   |    |   
 \\        /    |    \\   ||     \\  |    |  /  /   \\_/.  \\    |  / |        \\/        \\  |    |   
  \\__/\\  /\\____|__  /___|\\___  /  |______/   \\_____\\ \\_/______/ /_______  /_______  /  |____|   
       \\/         \\/         \\/                     \\__>                \\/        \\/            
                                />_______________________________________________________________
			[########[]______________________________________________________________>
         			\\>
"
anim("What is your name?")
name = gets.chomp.downcase
$player = Player.new(name)

class Game

def initialize
	$inventory = Inventory.new
	play_game
end

def play_game
while $player.alive?
	@choices = ["Fight", "Shop", "Inventory", "Equip", "Character"]
	anim("What do you want to do?")
	puts "----------"
	puts @choices
	puts "----------"
	ans = gets.chomp.downcase.capitalize!
	until @choices.include? ans
		puts "Please type that correctly"
		ans = gets.chomp.downcase.capitalize!
	end
	case ans
		when "Character" then $player.info
		when "Inventory" then $inventory.list_items
		when "Shop" then
			$shopkeeper.speak
		when "Fight" then
			$harpy = Harpy.new
			$harpy.fight
		when "Equip" then
			$inventory.list_equipment
			anim("What do you want to equip?")
			equip = gets.chomp.downcase
			case equip
				when "exit" then return true
				else
					$player.equip(equip)	
		end
	end
end
unless $player.alive?
	abort("you be dead")
end

end

end

Game.new
