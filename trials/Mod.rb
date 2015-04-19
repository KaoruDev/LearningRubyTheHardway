require "SAMPLE"
require "myclass"

class A
	include Sample
	def initialize
		puts "I am class A"
	end
end

classA = A.new()

classA.talk #Notice how we don't have say classA.Sample.talk

wid = Widget.new()

wid.talk