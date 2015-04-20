require "readline"

class Prompter
  def self.run(player=nil)
    return player_prompt(player) if player
    Readline.readline(":> ")
  end

  def self.didnt_get_that
    puts <<-MSG


#{Colors.cyan("Sorry I didn't get that.")}
===========================


    MSG
  end

  def self.player_prompt(player)
    Readline.readline "( #{Colors.green(player.hp)}HP #{Colors.yellow(player.mp)}MP ) :: > "
  end

  def self.enemy_stats(enemy)
    puts "\n#{enemy.fancy_name} has (#{Colors.red(enemy.hp)}hp) left."
  end

end

