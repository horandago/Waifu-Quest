class Inventory
  attr_accessor :equipment, :items
def initialize
  @items = [Potion.new, $map]
  @equipment = Array.new
end

def use_item(item)
  list = Hash.new
  $inventory.items.each {|obj| list[obj] = obj.to_s}
  list.each { |k,v| if item == k.to_s.downcase
  		if k.is_usable
  	    k.use
  			$inventory.items.delete(k)
  		elsif k.is_usable_multiple
        k.use
      else
  			anim("Nothing happens..")
        $game.continue
  		end
  		break
  	end 
  }
end

def use_item_battle(item)
  list = Hash.new
  $inventory.items.each {|obj| list[obj] = obj.to_s}
  list.each { |k,v| 
    if k.is_usable_battle
      if item == k.to_s.downcase
        if $player.hp == $player.max_hp
          k.use
  		  	$inventory.items.delete(k)
  	  		break
  	  	else
          k.use
    			$inventory.items.delete(k)
    			$used = true
    			break
    		end
      end
    else
  		if item == k.to_s.downcase
  		  puts "You cannot use that right now"
        $game.continue
      end
    end
  }
end

def add_item(item)
  if item.is_item
  	@items.push(item)
  elsif item.is_equipment
  	@equipment.push(item)
  end
end

def list_items
  if @items.empty?
  	puts "Your inventory is empty!"
  else
  	puts "\n"
  	counts = Hash.new(0)
  	@items.each { |name| counts[name.to_s] += 1 }
  	counts.each { |k,v| print "#{k.to_s} (#{v}) "}
  	print "\n"
  end
end

def list_equipment
  if @equipment.empty?
      puts "You have no equipment!"
  		return $game.current_map.map
    else
  		anim("What do you want to equip?")
    	print "\n"
    	counts = Hash.new(0)
    	@equipment.each { |name| counts[name.to_s] += 1 }
    	counts.each { |k,v| print "#{k.to_s} (#{v}) "}
    	print "\n"
  end
end

def list_spells
  if $player.spells.empty?
      puts "You have not learnt any spells yet!"
      return $game.current_map.map
    else
      anim("Which spell do you want to cast?")
      puts "----------"
      $player.spells.each { |name| puts "#{name.to_s}" }
      puts "----------"
  end
end

def list_all_items_price
  counts = Hash.new
  @combine = @items + @equipment
  @combine.each { |name| counts[name.to_s] = name.price if name.is_sellable}
  counts.each { |k,v| print "#{k.to_s} (#{v}gp) \n"}
end

  def sell(item) 
  	selling = Hash.new
  	@combine = @items + @equipment
  	@combine.each {|obj| selling[obj] = obj.to_s}
  	selling.each { |k,v| 
  		if item == v.downcase && k.is_junk
  			anim("Do you want to sell all of your #{item}(s)?(y/n)")
  			ans = gets.chomp.downcase
  			case ans
  				when "y", "yes"
  					@make = 0
  					@many = 0
  					selling.each {|k,v|
  						if item == v.downcase
  							@make += k.price / 2
                 @make = @make.to_i
  							@many += 1
  							$inventory.items.delete(k)
  						end }
  						anim("You sold #{@many} #{item}(s) for #{@make}gp!")
  						$player.gp += @make
  				when "n", "no"
  					puts "Fair enough..."
  			end
  			break
  		end
  		if item == v.downcase
  			$player.gp += k.price
  			anim("You sold the #{v} for #{k.price}gp!")	
  			if k.is_item
  				$inventory.items.delete(k)
  				break
  			end
  			if k.is_equipment
  				$inventory.equipment.delete(k)
  				break
  			end
  		end
  	}
  end

  def buy(item, seller)
    if $player.gp >= item.price
    	$inventory.add_item(item)
      $player.gp -= item.price
      anim("You purchase the #{item.to_s}!".colorize(:green))
      if item.is_equipment
        anim("Do you want to equip the #{item.to_s}?(y/n)")
        ynchoice
        case $ans
          when "yes","y"
            $player.equip(item.to_s.downcase!)
         end
      end
    else
      anim("#{seller.deny}")
    end
  end
end
