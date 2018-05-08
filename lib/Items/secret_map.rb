class Secret_map < Items
	def initialize
		super
		@name = "Secret map"
		@price = nil
		@is_sellable = false
    @is_usable_multiple = true
	end

	def use
puts "
             -----------
             |         |
             |   HUT   |
             |_________|
                 ||
                 ||
                 ||
           --------------
           |            |
           |   FOREST   |
           |____________|

"

	end
end

$secret_map = Secret_map.new

