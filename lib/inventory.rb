class Inventory
	attr_accessor :equipment, :items
def initialize
	@items = [Potion.new, Map.new]
	@equipment = Array.new
end

def use_item(item)
	list = Hash.new
	$inventory.items.each {|obj| list[obj] = obj.to_s}
	list.each { |k,v| if item == k.to_s.downcase
			k.use
			if k.is_usable
				$inventory.items.delete(k)
			end
			break
		end 
	}
end

def use_item_battle(item)
  list = Hash.new
  $inventory.items.each {|obj| list[obj] = obj.to_s}
  list.each { |k,v| if k.is_usable
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
		return
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

def list_all_items_price
	counts = Hash.new(0)
	@combine = @items + @equipment
	@combine.each { |name| counts[name.to_s] += name.value if name.is_sellable}
	counts.each { |k,v| print "#{k.to_s} (#{v}gp) \n"}
end

def sell(item)
	selling = Hash.new
	@combine = @items + @equipment
	@combine.each {|obj| selling[obj] = obj.to_s}
	selling.each { |k,v| 
		if item == k.to_s.downcase
			$player.gp += k.value
			anim("You sold the #{v} for #{k.value}gp!")	
			if k.is_item
				$inventory.items.delete(k)
			end
			if k.is_equipment
				$inventory.equipment.delete(k)
			end
		end
	}
end

end
