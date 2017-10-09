Dir["*.rb"].each { |file| require_relative file }
Dir["Monsters/*.rb"].each { |file| require_relative file }
Dir["Npc/*.rb"].each { |file| require_relative file }
Dir["Item/*.rb"].each { |file| require_relative file }


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
puts "What is your name?"
name = gets.chomp.downcase
$player = Player.new(name)
class Game

def initialize
	play_game
end

def play_game
while $player.alive?
	puts "What do you want to do?"
	puts "----------"
	puts "Fight\nShop"
	puts "----------"
	ans = gets.chomp.downcase
	until ans == "fight" || ans == "shop"
		puts "Please type that correctly"
		ans = gets.chomp.downcase
	end
	case ans
		when "shop" then
			$shopkeeper.speak
		when "fight" then
			$harpy = Harpy.new
			$harpy.fight
	end
end
unless $player.alive?
	abort("you be dead")
	
end

end

end

Game.new
