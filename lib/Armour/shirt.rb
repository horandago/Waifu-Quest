class Shirt < Armour
	def initialize
		super
		@name = "Shirt"
		@defence = 0
		@value = 5
	end
end
$shirt = Shirt.new