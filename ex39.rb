stuff = {
	'name' => "Zed",
	'age' => 36,
	'height' => 6,
	'city' => "San Francisco"
	}
	
puts stuff.inspect()
stuff.delete("city")
puts stuff.inspect()

########## Beginning of exercise
def br()
	puts '_' * 10
	print "\n"
end


states = {
	'Oregon' => 'OR',
	"Florida" => 'FL',
	"California" => 'CA',
	"New York" => 'NY',
	"Michigan" => "MI"
	}

cities = {
	"CA" => "San Francisco",
	"MI" => "Detroit",
	"FL" => "Jacksonville"
	}

cities["NY"] = "New York"
cities["OR"] = "Portland"


br()
puts "Michigan's abbreviation is: ", states["Michigan"]
puts "Florida has: ", cities[states["Florida"]]

br()
for state, abbrev in states #abbre = value states = key
	puts "%s is abbreviated %s" % [state, abbrev]
end

br()
for abbrev, city in cities
	puts "%s has the city %s" % [abbrev, city]
end

br()
for state, abbrev in states
	puts "%s state in abbreviated %s and has city %s" % [state, abbrev, cities[abbrev]]
end

br()
state = states["Texas"] # since there is no Texas, state = nil

if not state
	puts "Sorry, no Texas."
end

city = cities["TX"] || "Does Not Exist" # so will assign cities["TX"] to 2nd if first is false/null
puts "The city for the state 'TX is: %s" % city
