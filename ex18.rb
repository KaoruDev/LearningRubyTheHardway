def puts_two(*args) # the asterick indicates that we do not know how many arguments this function will accept.
	arg1, arg2 = args #unpacks arguments, or assigns it to variables.
	puts "arg1: #{arg1}, arg2: #{arg2}"
end

def puts_two_again(arg1, arg2)
	puts "arg1: #{arg1}, arg2: #{arg2}"
end

def puts_one(arg1)
	puts "arg1: #{arg1}"
end

def puts_none()
	puts "I got nothin'."
end

puts_two("Zed", "Shaw")
puts_two_again("Zed", "Shaw")
puts_one("First!")
puts_none()