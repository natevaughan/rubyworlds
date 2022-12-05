class Location
  def initialize(title, description)
    @title = title
    @description = description
    @nodes = Hash.new
  end
  
  def add_link(direction, link)
    @nodes[direction] = link
  end
  
  def title
    @title
  end

  def description
    @description
  end
end

class Link
  def initialize(text, destination)
    @text = text
    @destination = destination
  end
end

start = Location.new("Cave entrance", "You find yourself in a dimly-lit open space with a dirt floor and a single shaft of light coming from above. To the north, you can see light coming through a narrow passage.")

banquet_hall = Location.new("Banquet hall", "A large room opens before you, with a long wooden table and many scattered chairs, all in disrepair. To the west is a wooden door.")

start.add_link(:north, Link.new("You squeeze through the narrow opening.", banquet_hall))

current_location = start
last_location = nil

def print_desc(location)
  puts location.title
  puts "-------------------"
  puts location.description
end

def parse_action
  print "What is your next move? "
  action = gets.chomp
  action.to_sym
end

actions = [:quit]
playing = true

while(playing)
  puts ""
  if current_location != last_location
    print_desc current_location
    current_location = last_location
  end
  action = parse_action
  case action
    when :quit
      playing = false
      puts "Thanks for playing."
  else
    puts "I don't understand that action. Try one of these:"
    actions.each { |a| puts a.to_s }
  end
end
    

