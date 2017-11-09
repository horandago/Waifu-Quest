class Rope < Items
	def initialize
		super
		@name = "Rope"
		@price = 10
	end

	def use
   	anim("You teleport to #{$last_village.to_s}")
	  $game.current_map = $last_village
	end
end

