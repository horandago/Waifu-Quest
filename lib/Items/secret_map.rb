class Secret_map < Items
	attr_accessor :level
	def initialize
		super
		@is_usable = false
		@name = "Secret map"
		@value = nil
		@is_sellable = false
    @is_usable_multiple = true
	end

	def use
"
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

