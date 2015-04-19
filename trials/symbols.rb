
str = "killeen"
sym = str.to_sym

hase = {
	str => "hair"
}

puts hase[str]


####
def next_samps
	puts "-" * 10
end

next_samps

s = "Ruby"
t = s

s[-1] = ""
s = "Psych!"

puts t,s

#### Why can't singleton functions be assigned to symbols/fixnums
next_samps

s = "string 1"
s2 = "string 1"

def s.funcs
	puts "String 1 function"
end

def s2.funcs
	puts "String 2 function"
end

s.funcs
s2.funcs


###### 
next_samps

sym1 = :okay
sym2 = sym1

sym1 = sym1.to_i
puts sym1
puts sym2



###   WE CAN re-opn classes and add/revise different methods to it
class Class_samps
	def initialize
		puts "class samps ready!"
	end
	
	def another_meth
		puts "Not that kind meth!"
	end
end

techo = Class_samps.new()
techo.another_meth


class Class_samps
	def another_meth
		puts "ho brah no forget me!"
	end
end

techo.another_meth