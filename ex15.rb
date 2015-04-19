filename = ARGV.first #We take in an argument when executing this script

prompt ="> "
txt = File.open(filename) #We open the file and then store the info into a variable

puts "Here's your file: #{filename}"
puts txt.read() #Since we have already opened the file, we can now read it's contents by calling on the read method.

####DIFFERENT APPROACH!#######

puts "I'll also ask you to type it again:"
print prompt
file_again = STDIN.gets.chomp() #instead of having the user type in the filename before the script runs, this will ask for the filename while the script is running. it will then assign it to a variable.

txt_again = File.open(file_again) #We open the file and stored it again into a variable.
puts txt_again.read() #Again, since we have previously opened the file and stored it in a variable we can simply read it from here.