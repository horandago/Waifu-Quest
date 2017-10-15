class Shirt < Armour
	def initialize
		super
		@name = "Shirt"
		@defence = 0
	end
end
$shirt = Shirt.new