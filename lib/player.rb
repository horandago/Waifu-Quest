class Player
	attr_reader :name 
	attr_accessor :hp, :gp, :exp, :weapon, :max_hp, :base_attack, :level
		
	def initialize(name)
		@name = name
		@max_hp = 10
		@hp = 10
		@exp = 0
		@gp = 100
		@weapon = $bare_fists
		@armour = $shirt
		@base_attack = 0
		@level = 1
		@exp_hi = 10
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
			anim("You gain #{diff} HP!")
		else
			@hp += amount
			anim("You gain #{amount} HP!")
		end
	end

	def exp(gain)
		@exp += gain
		puts "You gained #{gain} exp!"
		if @exp >= @exp_hi
			level_up
		end
	end

	def level_up
		@level += 1
		@exp_hi = @exp_hi * 2.5
		@base_attack += 1
		@max_hp = @max_hp * 1.2
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
				end
				anim("You equip the #{@weapon.to_s}")
			end
			if k.is_armour
				if item == k.to_s.downcase
      				$inventory.equipment.push(@armour) if @armour != nil
      				$inventory.equipment.delete(k)
      				@armour = k
					anim("You put on the #{@armour.to_s}")
      			end
      		end
		}
	end

	def to_s
		@name
	end

	def info
		puts "Level : #{@level} | GP: #{@gp} | Weapon: #{@weapon.to_s} | Armour: #{@armour.to_s} | Exp: #{@exp}/#{@exp_hi.to_i}"
	end

end


class Mage < Player
	
	def use_mp(amount)
		@mp -= amount
	end
end
