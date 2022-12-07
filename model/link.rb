class Link
  attr_reader :text, :destination
  def initialize(text, destination)
    @text = text
    @destination = destination
  end
end