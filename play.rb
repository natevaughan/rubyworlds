require "./model/link.rb"
require "./model/location.rb"

entrance = Location.new("Cave entrance", "You find yourself in a dimly-lit open space with a dirt floor and a single shaft of light coming from above. To the north, you can see light coming through a narrow passage.")
banquet_hall = Location.new("Banquet hall", "A large room opens before you, with a long wooden table and many scattered chairs, all in disrepair. To the west is a wooden door.")

entrance.add_link(:north, Link.new("You squeeze through the narrow opening.", banquet_hall))
banquet_hall.add_link(:south, Link.new("You return through the narrow opening.", entrance))

current_location = entrance
last_location = nil

def print_desc(location)
  puts location.title
  puts "-------------------"
  puts location.description
end

actions = [:quit, :move]
directions = [:north, :south, :east, :west]
playing = true

def parse_action
  print "What is your next move? "
  gets.chomp.split(" ").map { |word| word.to_sym }
end

while(playing)
  puts ""
  if current_location != last_location
    print_desc current_location
    last_location = current_location
  end
  action = parse_action
  case action[0]
    when :quit
      playing = false
      puts "Thanks for playing."
    when :move
      direction = action[1]
      unless direction
        puts "Please specify a direction: "
	directions.each { |dir| puts dir.to_s }
      else
        link = current_location.get_link(direction)
        unless link
          puts "There's nothing that direction"
        else
          puts link.text
          current_location = link.destination
        end
      end
    else
      puts "I don't understand that action. Try one of these:"
      actions.each_key { |a| puts a.to_s }
  end
end
    

