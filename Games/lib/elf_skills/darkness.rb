class Darkness
  COST = 250
  DAMAGE_RANGE = (5..75)

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
    rand(20..50).times do
      damage = rand(DAMAGE_RANGE)
      @player.enemy.take_damage(damage, "The #{Colors.blue("rain")} of arrows")
    end
    @player.mp -= COST
  end
end
