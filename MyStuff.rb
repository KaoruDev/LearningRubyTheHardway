module MyStuff
	def self.apple()
		puts "I am an Apple inside MyStuff"
	end
	
	@@tang = "Tangerine in module"
	@sample = "encore!"
	TANGERINE = "Constant Tangerine"
	
	def self.mani() #Can create @@class_variables and create functions to manipulate them within the module.
		puts @@tang
		@@tang = "manipulate!"
		puts @@tang
	end
	
	def self.tang
		@@tang
	end
	
	def self.encore
		@sample = "Nope!"
		@sample
	end
end


class Monster
	def initialize
		puts "Class ready to go!"
	end
	
	attr_accessor :sample
	
	def say_it()
		puts @sample
	end
	

end