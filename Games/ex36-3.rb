# add Games folder to ruby's load path
Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each do |f|
  skip if f.match(/^\..+\.swp$/)
  load f
end

#Game.new

