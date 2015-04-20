class Battle
  def initialize(player)
    @player = player
    @enemy = Dragon.new
    @enemy.enemy = @player
    @player.enemy = @enemy

    @actors = [@player, @enemy]

    next_round
  end

  def next_round
    loop do
      apply_round_spells
      @actors.each(&:action)
      @actors.each(&:regenerate)
      Prompter.enemy_stats(@enemy)
      break if is_someone_dead?
    end
  end

  def apply_round_spells
  end

  def is_someone_dead?
    @actors.each do |actor|
      # dies will run a Process.exit
      actor.dies if actor.dead?
    end

    false
  end

end
