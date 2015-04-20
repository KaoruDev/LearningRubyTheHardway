# add Games folder to ruby's load path
Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each do |f|
  next if f.match(/^\..+\.swp$/)
  require_relative f
end

Game.new

