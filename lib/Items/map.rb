class Map < Items
	attr_accessor :level
	def initialize
		super
		@is_usable = false
		@name = "Map"
		@price = nil
		@is_sellable = false
		@level = 3
    @is_usable_multiple = true
	end

	def use
	if @level == 3
puts "
              _____                 ________
             | Hut |               | CASTLE |
             -------               ----------
                |                      |
  _______     ______     ______     _________ 
 |Village|   |Forest| --| Gate |-- |Dark Path|
 --------    --------   --------   ----------- 
     |          |
   ______     ______     _______
  | Lake |---|Plains|-- |Village|
  --------   --------   ---------
     |          |
   ______     ______                  _______
  |WATERS|   |Bridge|                |VOLCANO|
  --------   --------                ---------
                |                        |
   ______     ______     _________     ______ 
  | Cave |---|Fields| --|Mountains|-- | Path | 
  --------   --------   -----------   -------- 
                |
              _____
             | Home |
             --------
"
end

if @level == 2
puts "
 
  ______      ______
 |Village|   |Forest|
 --------    --------
     |          |
   ______     ______     _______
  | Lake |---|Plains|-- |Village|
  --------   --------   ---------
     |          |
   ______     ______                  _______
  |WATERS|   |Bridge|                |VOLCANO|
  --------   --------                ---------
                |                        |
   ______     ______     _________     ______ 
  | Cave |---|Fields| --|Mountains|-- | Path | 
  --------   --------   -----------   -------- 
                 |
              _____
             | Home |
             --------
"
	
end

if @level == 1
puts "
              ______       
             |Bridge|              
             --------                
                |                       
   ______     ______     _________  
  | Cave |---|Fields| --|Mountains| 
  --------   --------   ----------- 
                |
              ______
             | Home |
             --------

"
end
	end
end

$map = Map.new

