#skill and magic spells!

########## PALADIN!!
class Paladin
	@@favor = 50
	
	def initialize()
		puts "God has chosen you to fight for righteousness!"
	end
	
	def attack()
		player_hits = 0
		damage = 0 
		
		while player_hits < $stats[:hits]
			if rand($mob.dodge) < 30
				@@favor += 10
				puts "The Dragon evades your swift blade!"
				$mob.set_dodge(20)
			else			
				damage = rand($stats[:dmg]) + 30
				if rand(@@favor) > 70
					@@favor -= 50
					damage += rand(200)
					puts "God favors you in this battle and sends Michael the Archangel of Death."
					puts "Michael's illuminating spear DESECRATES the dragon for #{damage}!!!"
				else
					@@favor += 10
					puts "Your mighty sword wounds the dragon for #{damage}!"
				end
				$mob.take_damage(damage)
			end
			player_hits += 1
		end
		$stats[:mp] += rand(10) + 20
	end
end


class Paladin_magic
	@@max_armor = false

	def initialize()
	end
	
	def list
		puts "(1) Cast armor (10mp): Maximum of 15 damage is reduced." unless @@max_armor
		puts "(2) Cast heal (20mp): Gain 150-200 hps."
		puts "(3) Cast inner light (30mp): increases damage (100 max)!" if $stats[:dmg] <= 100
		puts "(4) Heaven's aid (70mp): Angels defend your honour!"
		puts "(5) Change your mind? Attack!!"
		puts "Please type in a number: "
	end
	
	def order
		spell = gets.chomp!
		case spell
			when "1"
				if $stats[:mp] >= 10 && !@@max_armor
					cast_armor()
				elsif @@max_armor
					puts "Your faith is at it's maximum"
					list()
					order()
				else
					oom()
				end
			when "2"
				if $stats[:mp] >= 20
					cast_heal()
				else
					oom()
				end
			when "3"
				if $stats[:mp] > 30 && $stats[:dmg] <= 100
					cast_inner_light
				elsif $stats[:dmg] >= 100
					puts "Your inner strength is at it's maximum!"
					list()
					order()
				else
					oom()
				end
			when "4"
				if $stats[:mp] >= 100
					cast_heaven_aid()
				else
					oom()
				end
			when "5"
				$player.attack
			else
				puts "You do not know that spells. Please enter a number"
				order
			end
	end
	
	def cast_armor()
		$stats[:arm] += rand(6) + 5
		if $stats[:arm] >= 15
			$stats[:arm] = 15
			@@max_armor = true
		end
		$stats[:mp] -= 10
		puts "Faith is thy armor, come at me bro! Damage reduced by #{$stats[:arm]}"
	end
	
	def cast_heal()
		$stats[:mp] -= 20
		heal_by = rand(50) + 150
		$stats[:hp] += heal_by
		puts "Your wounds close as your prayers have been answered. Gain: #{heal_by} hp!"
	end
	
	def cast_inner_light
		$stats[:mp] -= 30
		increase_dmg = rand(10) + 20
		$stats[:dmg] += increase_dmg
		puts "Your cause is just and must be done! Damage inscreased by: #{increase_dmg}"
		if $stats[:dmg] >= 100
			puts "Your inner light is at it's peak!"
		end
	end
	
	def cast_heaven_aid()
		$stats[:mp] -= 100
		heaven_hits = rand(5) + 5
		damage = 0
		puts "The clouds part as a ray of light appears in the sky."
		puts "Angels thurst their spears in your honor!!"
		while heaven_hits >= 0
			damage = rand($stats[:dmg]) + 10
			puts "A glowing spear from the heavens impales the dragon for #{damage}!!"
			$mob.take_damage(damage)			
			heaven_hits -= 1
		end
	end
end

############# ELF!!!
class Elf
	@@favor = 50
	def initialize()
		puts "Terra calls you to her rescue!"
	end
	
	def attack()
		player_hits = 0
		damage = 0 
		while player_hits < $stats[:hits]
			if rand($mob.dodge) < 30
				@@favor += 10
				puts "The Dragon bites your arrow in half!"
				$mob.set_dodge(30)
			else			
				damage = rand($stats[:dmg]) + 10
				if rand(@@favor) > 70
					@@favor -= 70
					damage += rand(20) + 30
					puts "The trees begin to move..."
					puts "Terra's roots ENTRALL the Dragon for #{damage}!"						
				else
					@@favor += 10
					puts "Your arrow pierces the Dragon for #{damage}!"		
				end
				$mob.take_damage(damage)
			end
			player_hits += 1
			#puts "Dragon dodge: #{$mob.dodge}"
		end
	$stats[:mp] += rand(10) + 5
	end
end


	
class Elf_magic
	@@haste = false
	@@vision = false

	def initialize()
	end
	
	def list
		puts "(1) Rejuvination (40mp) - Regenerate 100hp over 4 rounds." unless $player_buff
		puts "(2) Terra's Haste (50mp) - increase hits per round (+ 2-5 hits) One time cast." unless @@haste
		puts "(3) True vision (30mp) - increase your accuracy. One time cast." unless @@vision
		puts "(4) True shot(100mp) - Terra guide your arrow! (100-200 dmg)"
		puts "(5) Change your mind? Attack!!!"
		puts "Please enter a number"
	end
	
	def order
	spell = gets.chomp!
	print "\n"
	case spell
		when "1"
			 if $stats[:mp] >= 40 && !$player_buff
			 	cast_regen()
			 elsif $player_buff
			 	puts "The moon is already out."
			 	list()
			 	order()
			 else
			 	oom()			 
			 end
			
		when "2"
			if $stats[:mp] >= 50 && !@@haste
				cast_haste()
			elsif @@haste
				puts "You are already affected by haste."
				list()
				order()
			else
				oom()
			end	
		when "3"
			if $stats[:mp] >= 30 && !@@vision
				cast_true_vision()
			elsif @@vision
				puts "You are already affected by true vision."
				list()
				order()
			else
				oom()
			end
		when "4"
			if $stats[:mp] >= 100
				cast_true_shot()
			else
				oom()
			end
		when "5"
			$player.attack
		else
			puts "You don't know that spell"
			list()
			order()
		end
	end
	
	def cast_regen()
		$player_buff = true
		puts "An eerie glow cascades over the landscape. The moon has come to your aid."
		$player_buff_counter = 4
	end
	
	def cast_buff #regen buff
		if $player_buff_counter == 1
			puts "Clouds close in on the moon preventing it's aid..."
		else
			puts "Your injuries are soothed by moon light"
		end
		$stats[:hp] += 25
	end
	
	def cast_true_shot()
		$stats[:mp] -= 100
		#hits = ($stats[:hits] / 2).round
		#while hits > 0
			damage = rand(101) + 100
			puts "You close your eyes and trust in Terra to guide your arrow."
			puts "Guided arrows SHATTERS through for #{damage}!!!"
			$mob.take_damage(damage)
			#hits -= 1
		#end
	end
	
	def cast_haste
		@@haste = true
		$stats[:mp] -= 50
		more_hits = rand(4) + 2
		$stats[:hits] += more_hits
		puts "The winds lend you their speed! You gain #{more_hits} per round"
	end
	
	def cast_true_vision
		@@vision = true
		$stats[:mp] -= 30
		$mob.set_dodge(rand(300)+300)
		puts "The fog in your eyes lift as night becomes clear as day."
	end
	
	
end



############## ANCIENT!!!
class Ancient
	@@favor = 50
	
	def initialize
	end
	
	def attack()
		player_hits = 0
		damage = 0 
		while player_hits < $stats[:hits]
			if rand($mob.dodge) < 30
				@@favor += 10
				puts "The Dragon eats your magic!"
				$mob.set_dodge(30)
			else			
				damage = rand($stats[:dmg]) + 10
				if rand(@@favor) > 70
					@@favor -= 70
					damage += rand(200)
					puts "You become possessed by Ancient magic"
					puts "Chaos BREAKS the Dragon for #{damage}!"						
				else
					@@favor += 10
					puts "Your arcane missile mangles the Dragon for #{damage}!"		
				end
				$mob.take_damage(damage)
			end
			player_hits += 1
			#puts "Dragon dodge: #{$mob.dodge}"
		end
	$stats[:mp] += rand(50) + 50
	end


end

class Ancient_magic

	def initialize
	end
	
	def list
		puts "(1) Chaotic Shield (125mp) - Randomly absorb damage, last 4 rounds" unless $player_buff
		puts "(2) Chaos marble (75mp) - Chaos consummes your opponent, (0 - 250 damage)"
		puts "(3) Chain Lightning (200mp) - Lightning attacks everyone in the room...including you!!"
		puts "(4) Ice breathe (100mp) - Deals 20% of opponent's hp!"
		puts "(5) Concentrate (25mp) - Gain 100-200mp"
		puts "(6) Change your mind? Attack!!"
	end
	
	def order
		spell = gets.chomp!
		print "\n"
		case spell
			when "1"
				if $stats[:mp] >= 125 && !$player_buff
					cast_g_shield
				elsif $player_buff
					puts "Chaos already surrounds you\n"
					list()
					order()
				else
					oom()
				end
			when "2"
				if $stats[:mp] >= 100
					cast_chaos
				else
					oom()
				end
			when "3"
				if $stats[:mp] >= 200
					cast_chain
				else
					oom()
				end
			when "4"
				if $stats[:mp] >= 75
					cast_ice_breathe
				else
					oom()
				end
			when "5"
				if $stats[:mp] >= 25
					cast_concen
				else
					oom()
				end
			when "6"
				$player.attack
			
			else
				puts "You don't know that spell."
				list()
				order()
		end
	end
	
	def cast_g_shield
		$stats[:mp] -= 125
		$player_buff = true
		$player_buff_counter = 4
		puts "\"Nekarim Isopicise Theoditi\""
		puts "Chaos begins to swirl about you."			
	end
	
	def cast_buff
		if $player_buff_counter == 1
			puts "Order returns as chaos dissapates..."
		else
			puts "There is chaos all around you..."
		end
	end
	
	def cast_chaos
		$stats[:mp] -= 75
		damage = rand(250)
		puts "\"Jikel Inish Berbadum!\""
		puts "You rip open a space/time continum to unleash chaos on to the Dragon for #{damage}!"
		$mob.take_damage(damage)
	end
	
	def cast_chain
		$stats[:mp] -= 200
		damage = $stats[:dmg] + 50
		chain_num = rand(5) + 10
		puts "\"Neir Fista Merkants!\""
		
		while chain_num > 0
			puts "Lightning strikes the Dragon for #{damage}!"
			$mob.take_damage(damage)
			puts "Lightning jumps from the Dragon to you!"
			if $player_buff && rand(10) >= 6
				puts "Chaos interrupts reality. You gain #{(damage/2).round} life!"
				$stats[:hp] += (damage/2).round
			else
				puts "You take #{(damage / 3).round} damage!"
				$stats[:hp] -= (damage / 3).round
				player_health_check()
			end
			damage -= (damage/3).round
			chain_num -= 1
		end
		
		puts "The lightning dissapates into the air..."
		
	end
	
	def cast_ice_breathe
		$stats[:mp] -= 100
		damage = ($mob.hp() * 0.2).round
		puts "You gather all of your mana..."
		puts "Your icy breathe PETRIFIES the Dragon for #{damage}!!!"
		$mob.take_damage(damage)
	end
	
	def cast_concen
		$stats[:mp] -= 25
		mana = rand(100) + 100
		puts "Your mind wanders into the mystics... You gain #{mana}mp."
		$stats[:mp] += mana
	end

end
