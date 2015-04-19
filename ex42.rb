class Animal
end

## Class dog is a Animal
class Dog < Animal
	def initilaize(name)
		## Dog has a name
		@name = name
	end
end

## Cat is a Animal
class Cat < Animal
	def initialize(name)
		## Cat has a function initialize that take a name
		@name = name
	end
end

## Person is an object
class Person
	def initialize(name)
		## Person has a name
		@name = name
		
		## Person has a pet of some kind
		@pet = nil
	end
	
	attr_accessor :pet
	
	def play
		puts "#{@name} likes to MUD"
		puts "#{@name} likes to Dance!"
	end
end

## Employee is a Person
class Employee < Person
	def initialize(name, salary)
		
		##Employee has a name
		super(name) # This takes assigns @name (from Person) to name (argument)
		
		## Employee has a salary
		@salary = salary
	end
	
	def play
		puts "We can play things before the super"
		super() #pulls in everything from Person's play function.
		# super will bring in ALL the statements from it's parent
		puts "#{@name} is at work now!"
	end
end

harry = Employee.new("Harry", 20000)
harry.play()


count = 0
while count < 10
	puts "#{count}"
	count += 1
end
