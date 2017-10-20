Dir["*.rb"].each { |file| require_relative file }
Dir["Monsters/*.rb"].each { |file| require_relative file }
Dir["Npc/*.rb"].each { |file| require_relative file }
Dir["Items/*.rb"].each { |file| require_relative file }
Dir["Weapons/*.rb"].each { |file| require_relative file }
Dir["Armour/*.rb"].each { |file| require_relative file }
Dir["Maps/*.rb"].each { |file| require_relative file }

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
name = gets.chomp.downcase.capitalize
$player = Player.new(name)

class Game
	attr_accessor :current_map
	def initialize
		$inventory = Inventory.new
		$home = Home.new
		@current_map = $home
	end

	def play_game
		while $player.alive?
			@current_map.map
		end
	end

end

$game = Game.new
$game.play_game
