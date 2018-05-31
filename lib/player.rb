class Player
	attr_reader :name, :age, :race, :gender, :height, :name, :surname, :fullname
	attr_accessor :hp, :gp, :exp, :weapon, :max_hp, :base_attack, :level, :hair_colour, :hair_style, :hair_length, :spells 
		
	def initialize(name, surname, fullname, age, gender, hair_colour, hair_length, hair_style, race, height)
		@name = name
    @surname = surname
    @fullname = fullname
    @race = race
    @age = age
    @height = height
    @gender = gender
		@hair_colour = hair_colour
    @hair_length = hair_length
    @hair_style = hair_style
    @max_hp = 10
		@hp = max_hp
		@exp = 0
		@gp = 0
		@weapon = Bare_fists.new
		@armour = Shirt.new
    @helmet = Beret.new
		@spells = [$fireball, $teleport]
		@base_attack = 1
		@level = 1
		@exp_level_up = 50
    @curve = 75
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
		puts "You take #{amount} damage!".colorize(:red)
	end

	def heal(amount)
		if @hp + amount > @max_hp
			diff = @max_hp - @hp
			@hp = @max_hp
			anim("You gain #{diff.to_i} HP!".colorize(:green))
		else
			@hp += amount
			anim("You gain #{amount.to_i} HP!".colorize(:green))
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
		@exp_level_up = @exp_level_up + @curve
		@base_attack += 1
		@max_hp = @max_hp * 1.2
    @max_hp = @max_hp.to_i
		@hp = @max_hp
    @curve = @curve  * 1.35
		anim("LEVEL UP!!".colorize(:green))
    $game.continue
	end
			
	def equip(item)
		equip = Hash.new
		$inventory.equipment.each {|obj| equip[obj] = obj.to_s}
		equip.each { |k,v| if k.is_weapon
			if item == k.to_s.downcase
				$inventory.equipment.push(@weapon) if @weapon != nil	
				$inventory.equipment.delete(k)
				@weapon = k
				anim("You equip the #{@weapon.to_s}".colorize(:green))
				break
				end
			end
			if k.is_armour
				if item == k.to_s.downcase
      				$inventory.equipment.push(@armour) if @armour != nil
      				$inventory.equipment.delete(k)
      				@armour = k
					anim("You put on the #{@armour.to_s}".colorize(:green))
					break
   			end
        if item == k.to_s.downcase
              $inventory.equipment.push(@helmet) if @helmet != nil
              $inventory.equipment.delete(k)
              @helmet = k
          anim("You put on the #{@helmet.to_s}".colorize(:green))
          break
        end
     	end
		}
	end

	def to_s
		@name
	end

	def info
		puts "Level : #{@level} | HP: #{self.hp}/#{self.max_hp} | GP: #{@gp} | Exp: #{@exp}/#{@exp_level_up.to_i}"
	end

  def character
    anim("------#{self.fullname}------\n Age: #{self.age}\n Gender: #{self.gender}\n Race: #{self.race}\n Height: #{self.height}\n Hair: #{hair_length} and #{hair_colour} in a #{hair_style} style\n Weapon: #{@weapon.to_s}\n Armour: #{@armour.to_s}\n Helmet: #{@helmet.to_s}\n-------------------")
  end

	def dead
		anim("You died!")
		$game.continue
		@lose_gold = $player.gp / 10
		$player.gp -= @lose_gold.to_i
		anim("You lose #{@lose_gold.to_i}gp...")
		anim("You wake up in the nearest village...")
		$player.hp = $player.max_hp
		$game.current_map = $last_village
		return $game.current_map.map
	end
end


