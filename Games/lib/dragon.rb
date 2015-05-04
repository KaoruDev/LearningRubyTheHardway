class Dragon
  include ClassStats

  def self.fancy_name
    "The #{Colors.red("Dragon")}"
  end

  def fancy_name
    self.class.fancy_name
  end

  def target_name
    "#{fancy_name}"
  end

  def action
    rand(1..@haste).times do
      self.public_send(random_action) do |damage, msg, mp|
        @mp -= mp
        @enemy.take_damage(damage, msg)
      end
    end
  end

  def random_action
    dice = rand(1..10)
    return :tail if (1..3).include?(dice)
    return :roar if (4..6).include?(dice) && @mp > 20
    return :fire if 10 == dice && @mp > 10
    :claw
  end

  def dodge_message
    "#{self.target_name} swiftly dodges your attack!"
  end

  def modifiers
    {
      :hp => rand(20..25),
      :mp => rand(8..12),
      :haste => rand(2..4)
    }
  end

  def dies
    print <<-DEATH

The #{fancy_name} ROARS in AGONY as it disintergrates into ash...
*****************YOU WIN!!*****************

    DEATH
    Process.exit(0)
  end


  # Defining actions
  {
    :claw => ["#{self.fancy_name} swings it's MASSIVE claw", (5..15), 0],
    :tail => ["#{self.fancy_name} whips it's tail", (10..20), 0],
    :roar => ["#{self.fancy_name}'s deafening roar", (1..75), 20],
    :fire => ["#{self.fancy_name}'s funnel of #{Colors.red("FIRE")}", (50..250), 150]
  }.each do |action_name, (msg, range, mp)|
    class_eval <<-ACTIONS
      def #{action_name}
        yield(rand(#{range}), "#{msg}", #{mp})
      end
    ACTIONS
  end

end

