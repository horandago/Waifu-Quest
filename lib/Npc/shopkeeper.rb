require_relative '../npc.rb'
require_relative '../Item/*.rb'
require_relative '../items.rb'

class Shopkeeper < Npc
	def initialize
	end

	def speak
		puts "Hello #{$player.name}!"
		puts self
		Potion_hp.use
	end
end


$shopkeeper = Shopkeeper.new
