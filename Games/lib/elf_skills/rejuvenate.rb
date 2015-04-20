class Rejuvenate
  COST = 75
  HEAL_RANGE = (20..50)

  def self.description
		"Rejuvination (#{Colors.green(cost)}mp) - Regenerate up to 400hp over 4 rounds."
  end

  def self.cost
    COST
  end

  def initialize(player)
    @player = player
    @rounds = 4
  end

  def id
    :rejuvenate
  end

  def run
    @player.register_spell(self)
		puts "An eerie glow cascades over the landscape. The #{Colors.cyan("moon")} has come to your aid."
    @player.mp -= COST
  end

  def apply
    heal = rand(HEAL_RANGE)
    puts ""
    puts "You feel a warmth of the #{Colors.cyan("moon")}'s glow (+ #{Colors.green(heal)}hp)"
    @player.hp += heal
    @rounds -= 1
  end

  def done?
    @rounds <= 0
  end
end
