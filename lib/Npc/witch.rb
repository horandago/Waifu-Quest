class Witch < Npc
	def initialize
			@shop_list = ['Giga Potion', 'Dark Blade', 'Exit']
	end

	def speak
    @feather_count = 0
    @rock_count = 0
    @web_count = 0
    @goo_count = 0
		anim("Hello #{$player.name}!\nI see you are looking for a deal, am I right?\nI can craft things for you if you bring me the ingredients...\nWhat would you like?")
		loop do
      puts "----------"
      puts @shop_list
      puts "----------"
      ans = gets.chomp.downcase
			case ans
      when "dark blade"
        anim("Okay, please bring me 5 of each crafting materials in this land..")
        $inventory.items.each {|k|
          if k.to_s == "Feather"
						@feather_count += 1
					end
          if k.to_s == "Rock"
           @rock_count += 1
					end
					if k.to_s == "Goo"
						@goo_count += 1
					end
					if k.to_s == "Web"
						@web_count += 1
					end
					 }
        anim("Okay.. you have brought me:\n#{@feather_count} feathers\n#{@rock_count} rocks\n#{@web_count} webs,\n#{@goo_count} globs of goo")
        if @feather_count < 5 && @web_count < 5 && @rock_count < 5 && @goo_count < 5
					anim("You need more materials, you fuck boi!")
				else
					anim("Okay here's yo sword boiii")
					anim("You craft the Dark Blade!")
					$inventory.add_item(Dark_blade.new)
				end
      when "exit"
        anim("Suit yourself...you'll be mine soon enough!")
        break
	  	end
  	end
	end
end

$witch = Witch.new
