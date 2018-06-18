class Magical_hat < Helmet
	
	def initialize
		super
		@name = "Magical hat"
		@defence = 3
		@price = 90
	end
end
$magical_hat = Magical_hat.new
