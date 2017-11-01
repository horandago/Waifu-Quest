require 'io/console'
require 'colorize'

Dir["*.rb"].each { |file| require_relative file }
Dir["Monsters/*.rb"].each { |file| require_relative file }
Dir["Monsters/Bosses/*.rb"].each { |file| require_relative file }
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

$race_list = ["Human", "Elf", "Neko", "Vampire"]
$hair_colour_list = ["Black","Brown","Blonde","White","Pink","Red","Purple","Blue","Green"]
$hair_length_list = ["Long","Medium","Short"]
$hair_style_list = ["Curly","Straight","Wavy","Bob","Messy","Pony tail","Buns","Twin tails","Side pony tail"]
$gender_list = ["Male", "Female"]

def ynchoice
  $ans = gets.chomp.downcase
  until $ans == "y" || $ans == "n"
      anim( "Please type 'y' or 'n'")
      $ans = gets.chomp.downcase
    end
end

class Game
	attr_accessor :current_map
	def initialize
		$inventory = Inventory.new
		@current_map = $home	
	end

	def play_game
		while $player.alive?
			@current_map.map
		end
	end

	def continue
	  print "*press any key to continue*"
	  STDIN.getch
	  print "\r"
	  puts "------------------------------"
	end

  def character_creation
    $race_list = ["Human", "Elf", "Cat person", "Vampire"]
    $hair_colour_list = ["Black","Brown","Blonde","White","Pink","Red","Purple","Blue","Green"]
    $hair_length_list = ["Long","Medium","Short","Boyish"]
    $hair_style_list = ["Curly","Straight","Wavy","Bob","Messy","Pony tail","Buns","Twin tails","Side pony tail"]
    $gender_list = ["Male", "Female"]

#First Name
anim("What is your first name?:")
name = gets.chomp.downcase.capitalize!
until name != nil
  anim("Please enter something:")
  name = gets.chomp.downcase.capitalize!
end
name = name.split.first

#Surname
anim("And your second name? (Blank for nothing)")
surname = gets.chomp.downcase.capitalize!

#Fullname - check if surname applies
if surname == nil
  surname = ""
  fullname = name
else
  surname = surname.split.first
  fullname = name + " " + surname
end


anim("Randomly Generate appearance?(y/n)")
ynchoice
if $ans == 'y'
  #randomly generate character attribute
  answer = "n" #Only to keep the loop working
  while answer == "n"
    race = $race_list.sample
    gender = $gender_list.sample
    age = rand(16...40)
    hair_colour = $hair_colour_list.sample
    hair_length = $hair_length_list.sample
    hair_style = $hair_style_list.sample
  	height = rand(155..175)
    anim("#{fullname} is #{height}cm tall, A #{age}-year-old #{gender} #{race}, \nYou have #{hair_length} #{hair_colour} hair in a #{hair_style} style")
    anim("Is that correct?(y/n)")
    answer = gets.chomp.downcase
      until answer == "y" || answer == "n"
      	anim("Please type 'y' or 'n'")
      	answer = gets.chomp.downcase
      end
    end

elsif $ans == 'n'
  #Gender
  anim("Are you Male or female?:")
  gender = gets.chomp.downcase.capitalize!
  until $gender_list.include? gender
    anim("Please type that correctly")
    gender = gets.chomp.downcase.capitalize!
  end

  #Race
  anim("What is your race?")
  puts "---------"
  puts $race_list
  puts "---------"
  race = gets.chomp.downcase.capitalize!
  until $race_list.include? race
    anim("Please type that correctly")
    race = gets.chomp.downcase.capitalize!
  end

  #Age
  anim("How old are you?")
  begin
    age = gets.chomp
    age = Integer(age)
  rescue
    anim("Please enter a number:")
    retry
  end

  #Height
  anim("How tall are you? Please enter between 130 and 200 in cm:")
  begin
    height = gets.chomp
    height = Integer(height)
  rescue
    anim("Please enter a number between 130 and 200:")
    retry
  end
 
      #Hair
      anim("What colour is your hair?")
      puts "----------"
      puts $hair_colour_list
      puts "----------"
      hair_colour = gets.chomp.downcase.capitalize!
      until $hair_colour_list.include? hair_colour
      	anim("Please type that correctly")
      	hair_colour = gets.chomp.downcase.capitalize!
      end
      anim("How long is your hair?")
      puts "----------"
      puts $hair_length_list
      puts "----------"
      hair_length = gets.chomp.downcase.capitalize!
      until $hair_length_list.include? hair_length
      	anim("Please type that correctly")
      	hair_length = gets.chomp.downcase.capitalize!
      end
      anim("What style is your hair?")
      puts "----------"
      puts $hair_style_list
      puts "----------"
      hair_style = gets.chomp.downcase.capitalize!
      until $hair_style_list.include? hair_style
        anim("Please type that correctly")
        hair_style = gets.chomp.downcase.capitalize!
      end
    end

    $player = Player.new(name, surname, fullname, age, gender, hair_colour, hair_length, hair_style, race, height)

    $player.character

    anim("Welcome, #{$player.name}! Your adventure begins!!".colorize(:green))
  end

end

$game = Game.new
$game.character_creation
$game.play_game
