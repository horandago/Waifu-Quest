class Inventory
	attr_accessor :equipment, :items
def initialize
	@items = Array.new
	@equipment = Array.new
end

def use_item(item)
	thing = Hash.new
	$inventory.items.each {|obj| thing[obj] = obj.to_s}
	thing.each { |k,v| if k.is_usable
		if item == k.to_s.downcase
			k.use
			$inventory.items.delete(k)
			break
		end 
	end
	}
end

def to_s
	self.name
end

def add_item(item)
		@items.push(item)
end

def add_equipment(equipment)
	@equipment.push(equipment)
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
  else
  puts "\n"
  counts = Hash.new(0)
  @equipment.each { |name| counts[name.to_s] += 1 }
  counts.each { |k,v| print "#{k.to_s} (#{v}) "}
  print "\n"
  end

end

end
