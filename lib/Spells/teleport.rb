class Teleport < Spells
		def initialize
		    super
		    @name = "Teleport"
		    @combat_spell = false
		end

		def cast
				@move_map = [$home,$village,$water_village]
				new_map = Hash.new
				@move_map.each {|obj| new_map[obj] = obj.to_s}
				anim("Where would you like to go?:")
				puts "----------"
				new_map.each {|k,v| puts v}
				puts "Exit"
				puts "---------"
				ans = gets.chomp.downcase.capitalize!
				if ans != "exit"
				  new_map.each {|k,v| if ans == v
				  	$game.current_map = k
		    		puts "TELPORT!"
	        	puts "You have teleported to #{k}"
					end
					}
				end
		end
end

$teleport = Teleport.new
