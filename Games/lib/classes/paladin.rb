require_relative '../class_stats.rb'

class Paladin
  include ClassStats

  def initialize
    generate_stats
  end

  def self.fancy_name
    Colors.yellow("Paladin")
  end

  def self.description
    "#{fancy_name} - a noble soldier with #{Colors.green("heal and protection spells.")}"
  end
end

