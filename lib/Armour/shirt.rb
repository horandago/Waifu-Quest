class Shirt < Armour
	def initialize
		super
		@name = "Shirt"
		@defence = 0
		@price = 10
	end
end
$shirt = Shirt.new
