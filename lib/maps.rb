class Maps
	attr_reader :name, :move_map, :choices

	def initialize
		@choices = ["Look",
					"Fight",
					"Item",
					"Equip",
          "Spell",
					"Move"
					]
	end

	def to_s
		"#{@name}"
	end

	def inventory
		anim("Use an item?")
		ans = gets.chomp.downcase
		$inventory.use_item(ans)
	end

	def equip
		$inventory.list_equipment
		equip = gets.chomp.downcase
		$player.equip(equip)
	end

	def move
		new_map = Hash.new
		self.move_map.each {|obj| new_map[obj] = obj.to_s}
		anim("Where would you like to go?:")
		puts "----------"
		new_map.each {|k,v| puts v}
		puts "---------"
		ans = gets.chomp.downcase.capitalize!
		if ans != "Exit"
			new_map.each {|k,v|	if ans == v
			$game.current_map = k
			anim("You move to: #{v}")
			end
			}
		elsif ans == "Exit"
			return $game.current_map.map			
		else
			puts "Please type that correctly"
			ans = gets.chomp.downcase.capitalize!
		end
	end

  def wild_action(ans, enemy)
    case ans
    when "Item" then
      $inventory.list_items
      self.inventory
    when "Fight" then
      anim("You encounter the #{enemy.name}!")
      @enemy.fight
    when "Look" then
      self.look
    when "Spell" then
      $player.spells.each {|k|
        puts k if k.combat_spell == false
        spell_ans = gets.chomp.downcase
        if spell_ans == k.to_s.downcase
          if k.combat_spell == true     
    when "Equip" then
      self.equip
    when "Move" then
      self.move
    end
  end


  def home_action(ans, npc)
    case ans
      when "Item" then
        $inventory.list_items
        self.inventory
      when "Shop" then
        npc.speak
      when "Look" then
        self.look
      when "Equip" then
        self.equip
      when "Move" then
        self.move
      when "Rest" then
        self.rest
      when "#{$player.name}" then
        $player.character
    end
  end

	def rest
		anim("You take a rest in the village's inn\nYou restore your hp!")
		$player.hp = $player.max_hp
    	$game.continue
	end
end
