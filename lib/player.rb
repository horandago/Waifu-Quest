class Player
	attr_reader :name 
	attr_accessor :hp, :gp, :exp, :weapon, :max_hp, :base_attack, :level
		
	def initialize(name)
		@name = name
		@max_hp = 10
		@hp = max_hp
		@exp = 0
		@gp = 0
		@weapon = Bare_fists.new
		@armour = Shirt.new
		@base_attack = 0
		@level = 1
		@exp_level_up = 50
	end

	def alive?
		@hp > 0
	end

	def attack
		@weapon.send(:dmg) + $player.base_attack
	end

	def hurt(amount)
		amount -= @armour.defence
		if amount < 0
			amount = 0
		end
		@hp -= amount
		puts "You take #{amount} damage!"
	end

	def heal(amount)
		if @hp + amount > @max_hp
			diff = @max_hp - @hp
			@hp = @max_hp
			anim("You gain #{diff.to_i} HP!")
		else
			@hp += amount
			anim("You gain #{amount.to_i} HP!")
		end
	end

	def exp(gain)
		@exp += gain
		puts "You gained #{gain} exp!"
		if @exp >= @exp_level_up
			level_up
		end
	end

	def level_up
		@level += 1
		@exp_level_up = @exp_level_up * 2.5
		@base_attack += 1
		@max_hp = @max_hp * 1.2
		@hp = @max_hp
		anim("LEVEL UP!!")
	end
			
	def equip(item)
		equip = Hash.new
		$inventory.equipment.each {|obj| equip[obj] = obj.to_s}
		
		equip.each { |k,v| if k.is_weapon
			if item == k.to_s.downcase
				$inventory.equipment.push(@weapon) if @weapon != nil	
				$inventory.equipment.delete(k)
				@weapon = k
				anim("You equip the #{@weapon.to_s}")
				break
				end
			end
			if k.is_armour
				if item == k.to_s.downcase
      				$inventory.equipment.push(@armour) if @armour != nil
      				$inventory.equipment.delete(k)
      				@armour = k
					anim("You put on the #{@armour.to_s}")
					break
      			end
      		end
		}
	end

	def to_s
		@name
	end

	def info
		puts "Level : #{@level} | GP: #{@gp} | Weapon: #{@weapon.to_s} | Armour: #{@armour.to_s} | Exp: #{@exp}/#{@exp_level_up.to_i}"
	end

	def dead
		anim("You died!")
		$game.continue
		anim("You wake up in your home town...")
		$player.hp = $player.max_hp
		$game.current_map = $home
		return $game.current_map.map
	end
end


