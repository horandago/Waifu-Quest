class Inventory

def initialize
	@items = Array.new
end

def use_item(item)
	@items.delete_at(@items.index(item) || @items.length)
end

def add_item(item)
		@items.push(item)
end

def list_items
	if @items.empty?
		puts "Your inventory is empty!"
	else
	puts "\n"
	counts = Hash.new(0)
	@items.each { |name| counts[name] += 1 }
	counts.each { |k,v| print "#{k} (#{v})"}
	print "\n"
	end
end

end