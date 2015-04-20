class Haste
  COST = 50

  def self.description
		"Terra's Haste (#{Colors.green(cost)}mp) - increase hits per round (+ 2-5 hits) lasts 5 rounds."
  end

  def self.cost
    COST
  end

  def initialize(player)
    @player = player
    @rounds = 5
  end

  def id
    :haste
  end

  def run
    @player.register_spell(self)
		puts Colors.cyan("The winds lend you their speed!")
    @player.mp -= COST
  end

  def apply
    puts ""
		puts Colors.green("You feel the wind at your aid")
    @player.extra_hits = rand(2..5)
    @rounds -= 1
  end

  def done?
    @rounds <= 0
  end
end
