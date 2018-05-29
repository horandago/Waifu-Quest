class Beret < Helmet
	
	def initialize
		super
		@name = "Beret"
		@defence = 1
		@price = 10
	end
end
$beret = Beret.new
