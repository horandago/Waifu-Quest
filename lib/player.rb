class Player
	attr_reader :name 
	attr_accessor :hp, :gp, :exp, :weapon, :max_hp
		
	def initialize(name)
		@name = name
		@max_hp = 10
		@hp = 10
		@exp = 0
		@gp = 100
		@weapon = $bare_fists
		@armour = $shirt
	end

	def alive?
		@hp > 0
	end

	def attack
		@weapon.send(:dmg)
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
			end
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
		anim("You are level : ?\nWeapon: #{@weapon.to_s}\nArmour: #{@armour.to_s}")
	end

end


class Mage < Player
	
	def use_mp(amount)
		@mp -= amount
	end
end
