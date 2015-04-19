#Notes

def attack()
		player_hits = 0
		damage = 0 
		while player_hits < $stats[:hits]
			if rand($mob.dodge) > 50
				@@favor += 10
				puts "The Dragon bites your arrow in half!"
				$mob.set_dodge(20)
			else			
				damage = rand($stats[:dmg]) + 15
				if rand(@@favor) > 70
					@@favor -= 70
					damage += rand(50) + 50
					puts "Nature's roots strangle the Dragon for #{damage}"						
				else
					@@favor += 10
					puts "Your arrow pierces the Dragon for #{damage}!"		
				end
				$mob.take_damage(damage)
			end
			player_hits += 1
		end
	$stats[:mp] += rand(10) + 5
	end