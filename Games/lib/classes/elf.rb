require_relative "../skill_loader"

class Elf
  include ClassStats
  include SkillLoader

  attr_writer :haste

  def self.fancy_name
    Colors.green("Elf")
  end

  def self.description
    "#{fancy_name} - adept with a bow and an #{Colors.green("agile")} fighter, but very fragile."
  end

  def initialize
    super
    @extra_hits = 0
    @crit_chance = 4
  end

  def modifiers
    {
      :hp => 3,
      :mp => 6,
      :haste => 5
    }
  end

  def attack
    puts ""
    (rand(3..@haste)).times do
      if rand(1..10) < @crit_chance
        @enemy.take_damage(rand(20..30), "#{Colors.green("Gaia")} gives you wisdom to see your enemies weakness. Your arrow")
      else
        @enemy.take_damage(rand(10..20), "Your arrows shoots true and")
      end
    end
    @extra_hits = 0
  end

  def dodge_message
    "Gaia gives you speed to dodge #{@enemy.fancy_name}'s attack!"
  end
end

