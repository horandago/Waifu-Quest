class Ale < Items
	def initialize
		super
		@name = "Ale"
    @is_usable_battle = true
		@price = 10
	end

	def use
		anim("You drink the pint of Ale")
		$player.hurt(1)
		anim("You take 1 damage to your liver, or somthing")
	end
end


