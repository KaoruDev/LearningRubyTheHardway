# add Games folder to ruby's load path
Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each do |f|
  require_relative f
end

Game.new

