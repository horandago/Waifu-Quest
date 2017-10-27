class Witch < Npc
	def initialize
			@@shop_list = ['Potion', 'Bronze sword', 'Chainmail', 'Exit']
	end

	def speak
		anim("Hello #{$player.name}!\nWhat are you looking for today?")
		loop do
      break
	  end
  end
end

$witch = Witch.new
