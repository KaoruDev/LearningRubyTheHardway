#player build
class PLAYER
	def initialize()
		race = gets.chomp!
		load_race(race)
	end
	
	def load_race(race)
		@race = race
		case race
		when "1"
			@stats = {
				:hp => rand(100) + 300,
				:mp => rand(50) + 100,
				:dmg => rand(10) + 15,
				:hits => rand(1) + 2,
				:arm => rand(2),
				:dodge => rand(1)
			}
		when "2"
		when "3"
		when "4"
		else
			puts "Please enter a number (1-4)"
			new_race = gets.chomp!
			load_race(new_race)
		end
	end


########## GET STATS
def hp
		@stats[:hp]
	end
	
	def take_damage(x)
		@stats[:hp] -= x
		if @stats[:hp] <= 0
			puts "\nYou feel the warmth of life leave you..."
			puts "*******************YOU LOSE!!!!!*****************\n"
			Process.exit(0)
		end
	end
	
	def mp
		@stats[:mp]
	end
	
	def dmg
		@stats[:dmg]
	end
	
	def hits
		@stats[:hits]
	end
	
	def arm
		@stats[:arm]
	end
	
	def dodge
		@stats[:dodge]
	end
	
	def attack
		damage = rand(@stats[:dmg]) + 8
		if rand(5) < 4
			puts "Your mighty sword evicerates the dragon for #{damage}!"
		else
			damage += rand(100) + 100
			puts "God favors you in this battle and sends Michael the Arch Angel of Death."
			puts "Michael's illuminating spear DESECRATES the dragon for #{damage}!!!"
		end
		return damage
	end
	
end