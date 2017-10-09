require_relative '../monsters.rb'

puts "aaa"
class Harpy < Monster
  def initialize
    super
    @hp = 5
    @name = "Harpy"
    @attack = 1
end
end
