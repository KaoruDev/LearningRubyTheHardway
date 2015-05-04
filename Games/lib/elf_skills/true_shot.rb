class TrueShot
  COST = 100
  DAMAGE_RANGE = (100..500)

  def self.description
		"True shot (#{Colors.green(cost)}mp) - let Terra guide your arrow! (#{DAMAGE_RANGE} dmg)"
  end

  def self.cost
    COST
  end

  def initialize(player)
    @player = player
  end

  def run
    damage = rand(DAMAGE_RANGE)
    puts "You close your eyes and trust in #{Colors.green("Terra")} to guide your arrow."
    @player.enemy.take_damage(damage, "#{Colors.green("Terra")} releases a GIANT bolt and")
    @player.mp -= COST
  end
end
