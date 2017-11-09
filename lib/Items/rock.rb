class Rock < Items
	def initialize
		super
		@name = "Rock"
		@price = 2
		@is_usable = false
		@is_junk = true
	end
end

