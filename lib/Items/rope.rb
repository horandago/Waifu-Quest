class Rope < Items
	def initialize
		super
		@name = "Rope"
		@value = 5
	end

	def use
   	anim("You teleport to #{$last_village.to_s}")
	  $game.current_map = $last_village
	end
end

