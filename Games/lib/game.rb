class Game

  def initialize
    pick_class
  end

  def pick_class
    display_classes
  end

  def dislay_classes
    Utils.available_classes
  end

end

