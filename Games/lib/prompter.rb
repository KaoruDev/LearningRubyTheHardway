class Prompter
  def self.run
    print ":>"
    gets.chomp
  end

  def self.didnt_get_that
    puts <<-MSG


#{Colors.cyan("Sorry I didn't get that.")}
===========================


    MSG
  end

end

