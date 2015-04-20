require_relative "../skill_loader"

class Elf
  include ClassStats
  include SkillLoader

  def self.fancy_name
    Colors.green("Elf")
  end

  def self.description
    "#{fancy_name} - adept with a bow and an #{Colors.green("agile")} fighter, but very fragile."
  end

  def initialize
    generate_stats
  end

  def modifiers
    {
      :hp => rand(3..5),
      :mp => rand(6..10),
      :hits => rand(4..6),
      :dodge => 8
    }
  end

  def attack
    puts ""
    rand(3..@hits).times do
      @enemy.take_damage(rand(10..20), "Your arrows shoots true and")
    end
  end

  def magic
  end

  def dodge_message
    "Gaia gives you speed to dodge #{@enemy.fancy_name}'s attack!"
  end
end

