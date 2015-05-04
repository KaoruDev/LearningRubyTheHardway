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
      :no => method(:pick_class)
    })
  end

end

