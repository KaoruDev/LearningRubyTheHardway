require_relative "../skill_loader"

class Elf
  include ClassStats
  include SkillLoader

  attr_writer :extra_hits

  def self.fancy_name
    Colors.green("Elf")
  end

  def self.description
    "#{fancy_name} - adept with a bow and an #{Colors.green("agile")} fighter, but very fragile."
  end

  def initialize
    super
    @extra_hits = 0
  end

  def modifiers
    {
      :hp => rand(3..5),
      :mp => rand(6..10),
      :hits => rand(4..6),
      :dodge => rand(4..6)
    }
  end

  def attack
    puts ""
    (rand(3..@hits) + @extra_hits).times do
      @enemy.take_damage(rand(10..20), "Your arrows shoots true and")
    end
    @extra_hits = 0
  end


  def dodge_message
    "Gaia gives you speed to dodge #{@enemy.fancy_name}'s attack!"
  end
end

