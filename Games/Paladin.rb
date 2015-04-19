class Paladin
	def initialize()
		puts "God has chosen you to fight for righteousness!"
	end
	
	def attack()
		player_hits = 0
		damage = 0 
		favor = 50
	
		while player_hits < $stats[:hits]
			if $mob.dodge == 0 || rand($mob.dodge) == 0
				damage = rand($stats[:dmg]) + 10
				if rand(favor) > 70
					damage += rand(100) + 100
					puts favor
					favor -= 50
					puts "God favors you in this battle and sends Michael the Arch Angel of Death."
					puts "Michael's illuminating spear DESECRATES the dragon for #{damage}!!!"
				else
					favor += 5
					puts "Your mighty sword wounds the dragon for #{damage}!"
				end
				$mob.take_damage(damage)
			else
				puts "The Dragon evades your swift blade!"
			end
			player_hits += 1
		end
	end
end