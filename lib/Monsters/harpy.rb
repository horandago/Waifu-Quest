require_relative '../monsters.rb'

class Harpy < Monster
  def initialize
    super
    @hp = 5
    @name = "Harpy"
    @attack = 1
		@exp = 10
	end
	
	def description
		anim("A cute looking girl with bright blue wings and a beak")
	end

	def action
		anim("The harpy flaps a strong wind at you!")
		$player.hurt(self.attack)
	end
end
