class Rock < Items
	def initialize
		super
		@name = "Rock"
		@value = 1
		@is_usable = false
		@is_junk = true
	end
end

