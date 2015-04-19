module ClassStats
  def stats
    <<-STATS
      "HP: #{Colors.green(@hp)}"
      "MP: #{Colors.green(@mp)}"
    STATS
  end

  def generate_stats
    @hp = (modifiers[:hp] * 100).round
    @mp = (modifiers[:mp] * 50).round
    @accuracy = (modifiers[:accuracy] * 2).round
    @dodge = (modifiers[:dodge] * 1).round
  end

  def dead?
    @hp <= 0
  end

  def take_damage(damage)
    damage = damage_reducers(damage)
    @hp -= damage
  end

  def damage_reducers(damage)
  end

  def modifiers
    {
      :hp => 1,
      :mp => 1,
      :accuracy => 1,
      :dodge => 1
    }
  end
end
