require_relative "../colors"

class Darkness
  COST = 250
  DAMAGE_RANGE = (5..30)
  DESCRIPTIONS = [
    "An arrow falls from the #{Colors.blue("sky")} and",
    "A #{Colors.blue("shower")} of arrows",
    "A #{Colors.yellow("bolt of lightning")} from the cloud above"
  ]

  def self.description
		"Only the most powerful elves can create a cloud of arrows causing #{Colors.red("DARKNESS")} (#{Colors.green(cost)}mp)"
  end

  def self.cost
    COST
  end

  def initialize(player)
    @player = player
  end

  def run
    damage = rand(DAMAGE_RANGE)
    puts "The winds of the sky aid you as you shoot arrows into the sky"
    rand(60..75).times do
      damage = rand(DAMAGE_RANGE)
      @player.enemy.take_damage(damage, DESCRIPTIONS.sample)
    end
    @player.mp -= COST
  end
end
