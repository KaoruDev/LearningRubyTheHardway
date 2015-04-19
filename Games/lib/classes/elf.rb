require_relative '../class_stats.rb'

class Elf
  include ClassStats

  def initialize
    generate_stats
  end

  def self.fancy_name
    Colors.green("Elf")
  end

  def self.description
    "#{fancy_name} - adept with a bow and an #{Colors.green("agile")} fighter, but very fragile."
  end
end

