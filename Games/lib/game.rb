class Game
  def initialize
    pick_class
  end

  def pick_class
    @player = ClassPicker.pick_class
    are_stats_ok
  end

  def dislay_classes
    Utils.available_classes
  end

  def are_stats_ok
    question = "#{@player.stats}\n\nHappy with stats?"

    AskQuestion.yes_no(question, {
      :yes => -> { true },
      :no => -> {
        reroll_or_pick_again
      }
    })
  end

  def reroll_or_pick_again
    AskQuestion.multiple_choice(
      "What would you like to do?",
      {
        "Pick another class" => method(:pick_class),
        "Roll again" => -> {
          @player.generate_stats
          are_stats_ok
        }
      })
  end

end

