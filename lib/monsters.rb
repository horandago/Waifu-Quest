class Monster
	attr_reader :name, :attack, :exp, :gold_lo, :gold_hi, :items, :is_boss
	attr_accessor :hp
	def initialize
		@is_boss = false
	end

	def alive?
		@hp > 0
	end

	def hurt(amount)
		@hp -= amount
		puts "#{self.name} takes #{amount} damage!".colorize(:green)
	end

  def drop
		@drop_item = items.sample
		@drop_gold = rand(@gold_lo...@gold_hi)	
		@grammar = ""
		unless @drop_item == "nothing"
			$inventory.add_item(@drop_item)
			@grammar = "1 "
		end
		$player.gp += @drop_gold
		anim("The #{self.name} dropped #{@grammar}#{@drop_item.to_s} and #{@drop_gold}gp!".colorize(:green))
	end

	def fight
		while $player.alive?
			@fight_list = ["attack","skill","item","look","run", "a", "s", "i", "l", "r"]
			puts "-------------------------"
			puts "#{$player.name}: #{$player.hp.to_i}HP | #{self.name}: #{self.hp}HP"
			puts "-------------------------"
			anim("What do you want to do?")
			puts "----------"
			puts "Attack\nSkill\nItem\nLook\nRun"
			puts "----------"
			ans = gets.chomp.downcase
      until @fight_list.include? ans
				puts "Please type that correctly:"
				ans = gets.chomp.downcase
			end
			case ans
				when "attack", "a"
					anim("You attack the #{self.name}!")
					self.hurt($player.attack)
				when "item", "i"
					if $inventory.items.empty?
						puts "You have no items"
						return self.fight
					else
						$inventory.list_items
						puts "exit"
  			  			anim("Use an item?")
   		 				ans = gets.chomp.downcase
   		 				$used = false
						$inventory.use_item_battle(ans)
						if $used == true
							self.action
						end
						return self.fight
					end
				when "look", "l"
					self.description
					return self.fight
				when "run", "r"
					anim("You try to escape!".colorize(:blue))
					self.action
					if $player.hp > 0
						anim("......You manage to escape!".colorize(:green))
						$game.continue
						break
					else
						$player.dead
						break
					end
				when "skill", "s"
					puts "Which skill do you want to use?\n----------"
					$player.skills.each {|k| puts k.to_s }
					puts "----------"
					ans = gets.chomp.downcase
					if ans == "cancel"
						return self.fight
					end
					$player.skills.each {|k| if ans == k.to_s.downcase
						self.hurt($fireball.cast)
						else
							puts "Please type that correctly"
							return self.fight
						end
					}
      end
			if self.hp < 1
				anim("You defeated the #{self.name.capitalize}!")
				$player.exp(exp)
				self.drop
				break
   		end
			if $player.hp < 1
				$player.dead
				break
			end
			self.action 	
		end	
	end
end



