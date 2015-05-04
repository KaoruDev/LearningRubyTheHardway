module ClassStats
  def self.included(base)
    base.class_eval do
      attr_accessor :hp, :mp, :enemy, :haste
    end
  end

  def initialize
    @affected_spells = {}
    generate_stats
  end

  def enemy=(enemy)
    @enemy ||= enemy
  end

  def target_name
    "you"
  end

  def stats
    <<-STATS
      "HP: #{Colors.green(@hp)}"
      "MP: #{Colors.green(@mp)}"
      "haste: #{Colors.green(@haste)}"
    STATS
  end

  def generate_stats
    @hp = (modifiers[:hp] * 100).round
    @mp = (modifiers[:mp] * 50).round
    @dodge = modifiers[:dodge]
    @haste = modifiers[:haste]
  end

  def dead?
    @hp <= 0
  end

  def dies
    puts "#{@enemy.fancy_name} #{Colors.red("INCINDERATES")} you into ashes!"
    puts "**************YOU LOSE!!!*********************"
    Process.exit(0)
  end

  def take_damage(damage, msg)
    damage = damage_reducers(damage)
    @hp -= damage
    if damage > 0
      puts "#{msg} #{HitsScale.damage(damage)} #{self.target_name} for (#{Colors.red(damage)})!!"
    end
  end

  def damage_reducers(damage)
    return 0 if dodge
    damage
  end

  def dodge
    if rand(1..15) < @haste
      puts dodge_message
      true
    end
  end

  def modifiers
    {
      :hp => 1,
      :mp => 1,
      :haste => 1,
      :dodge => 1
    }
  end

  def regenerate
    mp_regen = @mp_regen || 1
    hp_regen = @hp_regen || 1
    @hp += (modifiers[:hp] * hp_regen).round
    @mp += (modifiers[:mp] * mp_regen * 3).round
  end

  def affected_by?(spell)
    !!@affected_spells[spell.to_sym]
  end

  def register_spell(spell)
    @affected_spells[spell.id] = spell
  end

  def apply_spell_effects
    @affected_spells.each do |key, spell|
      spell.apply
      @affected_spells.delete(key) if spell.done?
    end
  end

end
