class Inventory
	attr_accessor :equipment, :items
def initialize
	@items = Array.new
	@equipment = []
end

def use_item(item)
	@items.delete_at(@items.index(item) || @items.length)
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
	@items.each { |name| counts[name] += 1 }
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
  @equipment.each { |name| counts[name] += 1 }
  counts.each { |k,v| print "#{k.to_s} (#{v}) "}
  print "\n"
  end

end

end
