class HitsScale
  def self.damage(damage)
    verb = if (0...10).include?(damage)
      "hits"
    elsif (10...15).include?(damage)
      "gashes"
    elsif (15...25).include?(damage)
      "WOUNDS"
    elsif (25...35).include?(damage)
      Colors.red("TORMENTS")
    elsif (35...50).include?(damage)
      ">>#{Colors.red("EVISVERATES")}<<"
    elsif (50..100).include?(damage)
      "<<=#{Colors.yellow("DE")}#{Colors.red("VITAL")}#{Colors.yellow("IZES")}=>>"
    elsif (100..200).include?(damage)
      "deals #{Colors.red("<<=")} #{Colors.bold("GODLIKE")} #{Colors.red("=>>")} damage"
    elsif damage > 200
      Colors.randomize_letters("OUTER REALM PAIN")
    end

    verb || "hits"
  end
end
