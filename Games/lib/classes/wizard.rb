require_relative "../class_stats.rb"

class Wizard
  include ClassStats

  def self.fancy_name
    Colors.blue("Wizard")
  end

  def self.description
    "#{fancy_name} - a being that has survived time through ancient #{Colors.green("magic")}."
  end

  def initialize
    generate_stats
  end

end

