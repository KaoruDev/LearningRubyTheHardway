class HasteSpell
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
    :haste_spell
  end

  def run
    @player.register_spell(self)
		puts Colors.cyan("The winds lend you their speed!")
    @player.mp -= COST
    @haste_added = rand(5..10)
    @player.haste += @haste_added
  end

  def apply
		puts Colors.green("\nYou feel the wind at your aid")
    @rounds -= 1
  end

  def done?
    if @rounds <= 0
      @player.haste -= @haste_added
      true
    end
  end
end
