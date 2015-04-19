require magic

$hp = 0
$mp = 0
$dmg = 0
$hits = 0
$arm = 0
$dodge = 0
$race = ""

$mob = {}

def prompt()
	print "<"
	print "Your Stats: #{$hp}HP #{$mp}MP" if $hp > 0
	print "> "
end

def stats(race)
	case race
		when "1"
			$hp = rand(100) + 300
			$mp = rand(50) + 100
			$dmg = rand(10) + 15
			$hits = 2
			$arm = 1
			$dodge = 1
			prompt
			ready
		when "2"
		when "3"
		when "4"
		else
			puts "Please enter a number (1-4)"
			race = gets.chomp!
			stats(race)
	end
end

def ready()
	puts "Happy with stats? (yes/no)"
	set = gets.chomp!
	if set == "yes"
		mob_stats
	elsif set == "no"
		$hp = 0
		welcome
	else
		puts "Let's try that one more time"
		ready
	end
end

def mob_stats()
	$mob[:hp] = rand(300).round + 500
	$mob[:dmg] = rand(30).round + 15
	$mob[:arm] = rand(5).round
	$mob[:hits] = rand(2).round + 1
	$mob[:dodge] = rand(1).round / 10
	report
	puts "You're figting a dragon!"
	decision
end

def report
	print "Dragon's Stats: "
	print "HP: #{$mob[:hp]} "
	print "Damage: #{$mob[:dmg]} "
	print "Armor: #{$mob[:arm]} "
	puts "Dodge Chance: #{$mob[:dodge]}"
end

def decision
	prompt; print "Attack or Magic?"
	decide = gets.chomp!
	if decide.include? "att"
		attack
	elsif decide.include? "mag"
	
	else
		puts "Let's try that again."
		decision
	end
end

def attack
	hits_i = 0
	mob_hits_i = 0
	while hits_i < $hits
		if $mob[:dodge] != 0 && rand($mob[:dodge]).round > 0
			puts "The Dragon dodges your attack!"
		else
			damage_to_mob
		end
		hits_i += 1
	end
	
	while mob_hits_i < $mob[:hits]
		if $dodge != 0 && rand($dodge).round > 0
			puts "You dodge the Dragon's attack!"
		elsif rand(5) > 3
			magic_to_player
		else
			damage_to_player
		end
		mob_hits_i += 1
	end
	
	report
	decision
end

def damage_to_mob
	damage = 0
	damage = rand($dmg) + 15 - $mob[:arm]
	$mob[:hp] -= damage
	puts "Your forceful slash hits the dragon for #{damage}"
	health_check
end

def damage_to_player
	damage = 0
	damage = rand($mob[:dmg]) + 15 - $arm
	$hp -= damage
	puts "The Dragon swing it's mighty claw and deals you #{damage}!"
	health_check
end

def magic_to_player
	damage = 0
	damage = (rand($mob[:dmg]) + 15) * 3 - $arm
	$hp -= damage
	puts "The Dragon spits out a whirlwind of fire and deals you #{damage}!"
end
	
def health_check
	if $mob[:hp] <= 0
		puts "The Dragon roars in agony as it disintegrates into ash.."
		puts "**************************************"
		puts "**************************************"
		puts "**************YOU WIN*****************"
		puts "**************************************"		
		puts "**************************************"
		Process.exit(0)
	end
	
	if $hp <= 0
		puts "You feel the warmth of life escape..."
		puts "**************************************"
		puts "**************************************"
		puts "**************YOU LOSE****************"
		puts "**************************************"		
		puts "**************************************"
		Process.exit(0)
	end
end


def welcome
	puts "Welcome to Mini Mud!"
	puts "Choose your race!"
	puts "1) Human Paladin - a noble soldier with heal and protection spells!"
	puts "2) Elf Ranger - adept with a bow and an agile fighter, but very fragile."
	puts "3) Centaur Warrior - Centaur smash!"
	puts "4) Ray Wizard - made of pure energy with explosive attacks but nimble in stature."
	prompt; race = gets.chomp!
	stats(race)
end

welcome()
