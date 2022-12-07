class Location
  attr_reader :title, :description
  def initialize(title, description)
    @title = title
    @description = description
    @links = Hash.new
  end

  def add_link(direction, link)
    @links[direction] = link
  end

  def get_link(direction)
    @links[direction]
  end
end