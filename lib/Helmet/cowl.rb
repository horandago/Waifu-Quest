class Cowl < Helmet
	
	def initialize
		super
		@name = "Cowl"
		@defence = 1
		@price = 15
	end
end
$cowl = Cowl.new
