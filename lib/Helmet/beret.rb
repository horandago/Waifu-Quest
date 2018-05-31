class Beret < Helmet
	
	def initialize
		super
		@name = "Beret"
		@defence = 0
		@price = 5
	end
end
$beret = Beret.new
