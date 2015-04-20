class Game
  def initialize
    pick_class
  end

  def pick_class
    @player = ClassPicker.pick_class
    check_stats
    battle_begin
  end

  def battle_begin
    Battle.new(@player)
  end

  def check_stats
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
          check_stats
        }
      })
  end

end

