require_relative 'Mob'
require_relative 'skills_and_magic'

#$lvl = 1 Somehow include levels, i.e. once $player beats first mob, gains spells/skill and mob increases difficulty. Topoff at lvl 5


################### GLOBAL VARIABLES

$race_info = <<PARAGRAPH
1) Human Paladin - a noble soldier with heal and protection spells.
2) Elf Ranger - adept with a bow and an agile fighter, but very fragile.
3) Ancient Wizard - a being that has survived time through ancient magic.
PARAGRAPH
$race
$stats = {}

$mob = Mob.new()
$magics
$player
$player_buff = false #Trigger to on and off buff
$player_buff_counter = 0 #number of rounds the buff will last. Will also trigger effect so long counter is > 0

################### METHODS
def roll_stats(race)
	case race
		when "1" #Paladin stats
			$stats = {
				:hp => rand(100) + 500,
				:mp => rand(50) + 75,
				:dmg => rand(10) + 35,
				:hits => 2,
				:blo => rand(2) + 3,
				:dodge => rand(1),
				:arm => 0
			}
			happy
		when "2" #Elf stats
			$stats = {
				:hp => rand(100) + 200,
				:mp => rand(50) + 125,
				:dmg => rand(10) + 15,
				:hits => rand(2) + 4,
				:blo => 0,
				:dodge => rand(2) + 2,
				:arm => 0
			}
			happy
		when "3" #Ancient stats
			$stats = {
				:hp => rand(100) + 300,
				:mp => rand(75) + 700,
				:dmg => rand(10) + 40,
				:hits => 3,
				:blo => 0,
				:dodge => 0,
				:arm => 0
			}
			happy
		else
			puts "Please enter a number (1-4)"
			$race = gets.chomp!
			roll_stats($race)
		end
end


def happy()
	puts "Yours stats: #{$stats[:hp]} HP #{$stats[:mp]} MP"
	puts "Hits per round: #{$stats[:hits]}"
	puts "Dodge chance: #{$stats[:dodge]}"
	print "Satisfied with your stats (yes/no)?"
	answer = gets.chomp!
	if answer.downcase.include? "y"
		case $race
			when "1"
				$magics = Paladin_magic.new()
				$player = Paladin.new()
			when "2"
				$magics = Elf_magic.new()
				$player = Elf.new()
			when "3"
				$magics = Ancient_magic.new()
				$player = Ancient.new()
			else
				puts "uhhhh...."
			end
	elsif answer.downcase.include? "n"
		print "\n"
		print $race_info
		print "Choose again! > "
		$race = gets.chomp!
		roll_stats($race)
	else
		puts "Come again?"
		happy
	end
end

def battle()
	mob_hits = 0

	puts "\nThe Dragon has #{$mob.hp} HP left \n"
	puts "You raise your guard. What shall we do (Magic or Attack)?"
	print "Your stats: ( #{$stats[:hp]}Hp #{$stats[:mp]}MP ) "
	action = gets.chomp!
	print "\n"

	if action.downcase.include? "at"
		$player.attack
	elsif action.downcase.include? "ma"
		$magics.list
		$magics.order

	else
		puts "Dancing isn't going to help! Fight!!!"
		battle
	end


############## DRAGON HITS

	while mob_hits < $mob.hits
		if $stats[:dodge] == 0 || rand($stats[:dodge]) <= 0
			if $stats[:blo] > 0 && rand($stats[:blo]) > 1
				puts "You block the Dragon's deafening ROAR with your shield!"
			else
				damage = $mob.attack
				$stats[:hp] -= damage
			end
		else
			puts "You swiftly dodge the Dragon's tail!"
		end
		player_health_check()
		mob_hits += 1
	end

	if $player_buff_counter > 0 && $player_buff
		$magics.cast_buff
		$player_buff_counter -= 1
		if $player_buff_counter == 0
			$player_buff = false
		end
	end


	battle
end

def player_health_check
	if $stats[:hp] <= 0
		puts "You feel the warmth of life leave you....\n***********************YOU LOSE************************"
		Process.exit(0)
	end
end

def oom()
	puts "\nYou don't have enough mana (mp)\n"
	$magics.list()
	$magics.order()
end


####################### GAME ON!!

puts "Welcome to Mini Mud! \nChoose your race!"
print $race_info
print "> "
$race = gets.chomp!
roll_stats($race)


puts "A dragon swoops down in front of you!! Test your worthiness!"
battle()
