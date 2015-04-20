module ClassStats
  def self.included(base)
    base.class_eval do
      attr_reader :hp, :mp
    end
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
      "dodge: #{Colors.green(@dodge)}"
      "hits: #{Colors.green(@hits)}"
    STATS
  end

  def generate_stats
    @hp = (modifiers[:hp] * 100).round
    @mp = (modifiers[:mp] * 50).round
    @dodge = modifiers[:dodge]
    @hits = modifiers[:hits]
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
    if rand(1..10) < @dodge
      puts dodge_message
      true
    end
  end

  def modifiers
    {
      :hp => 1,
      :mp => 1,
      :hits => 1,
      :dodge => 1
    }
  end

  def regenerate
    mp_regen = @mp_regen || 1
    hp_regen = @hp_regen || 1
    @hp += (modifiers[:hp] * hp_regen).round
    @mp += (modifiers[:mp] * mp_regen).round
  end

  def action
    question = <<-QUESTION

=================================
On guard! What would you like to do?
    QUESTION

    AskQuestion.multiple_choice(question, {
      "Attack with all your might!" => method(:attack),
      "Cast a spell!" => method(:magic)
    }, self)
  end
end
