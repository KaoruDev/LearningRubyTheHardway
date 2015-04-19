# MOB!!!
class Mob
	def initialize()
		@stats = {
			:hp => rand(300) + 1200,
			:dmg => rand(30) + 15,
			:hits => rand(2) + 2,
			:dodge => rand(30) + 70
		}
	end
	
	def hp
		@stats[:hp]
	end
	
	def take_damage(x)
		@stats[:hp] -= x
		@stats[:dodge] -= 15
		if @stats[:hp] <= 0
			puts "\nThe Dragon ROARS in AGONY as it disintergrates into ash..."
			puts "*****************YOU WIN!!*****************\n"
			Process.exit(0)
		end
	end
	
	def absorb_damage(x)
		@stats[:hp] += x
	end
	
	def dmg
		@stats[:dmg]
	end
	
	def hits
		@stats[:hits]
	end
	
	def dodge
		@stats[:dodge]
	end
	
	def set_dodge(x)
		@stats[:dodge] += x
	end
	
	def attack
		damage = rand(@stats[:dmg]).round + 15 - rand($stats[:arm]).round
		if $race == "3" && $player_buff && rand(10) >= 5
			$stats[:hp] += damage
			puts "The chaos interrupts reality! You gain #{damage} life!"
			return 0
		else
			if rand(12) > 10
				damage += rand(50) + 50
				puts "The dragon's whirlwind of fire INCINDERATES you for #{damage}!!!"
				return damage
			else
				puts "The dragon's mighty claw mauls you for #{damage}!!"
				return damage
			end
		end
	end
end