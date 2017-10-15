
class Items
	attr_reader :is_usable
	def initialize
		@is_usable = true
	end

	def to_s
		"#{@name}"
	end

end

