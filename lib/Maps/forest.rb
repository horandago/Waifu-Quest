class Forest < Maps

  def initialize
  	super
  	@name = "Forest"
  end

  def look
  	anim("A dark forest with a very ominous air about it...")
  end

  def map
  	@move_map = [$plains, $gate]
    if $inventory.items.include? $secret_map
      @move_map.push($hut)
    end
  	anim("What do you want to do?")
  	puts "-----FOREST-----"
		print_choices
  	puts "----------------"
  	$player.info
  	print "\n: "
  	ans = gets.chomp.downcase.capitalize!
  	until @choices.include? ans
  		puts "Please type that correctly"
  		ans = gets.chomp.downcase.capitalize!
  	end
  	@monsters_list = [Giant_spider.new]	
  	@enemy = @monsters_list.sample
  	wild_action(ans, @enemy)
  end
end
$forest = Forest.new
