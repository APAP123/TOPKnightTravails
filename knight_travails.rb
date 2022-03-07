# knight_travails.rb

# Represents vertice on graph
class Node
  attr_accessor :data, :links

  def initialize(data = nil, links = [])
    @data = data
    @links = links
  end

  # Appends node to end of links
  def add_link(node)
    @links.append(node)
  end

  # Prints own links in "[x, y]" formatting
  def print_links
    @links.each do |link|
      puts "[#{link.data[0]}, #{link.data[1]}]"
    end
  end
end

# Determines if move is valid
def valid_move?(move)
  return false if move[0] < 0 || move[0] > 7
  return false if move[1] < 0 || move[1] > 7

  true
end

# Returns all valid moves from given location
def valid_moves(location)
  valid_move?(location[0] - 2, location[1] - 1)
end

# builds graph from current location
def build_graph(location)
  root = Node.new(location)

  # X-Axis
  [-2, 2].each do |x|
    x_loc = location[0] + x
    [-1, 1].each do |y|
      y_loc = location[1] + y
      root.add_link(Node.new([x_loc, y_loc])) if valid_move?([x_loc, y_loc])
    end
  end

  # Y-Axis
  [-2, 2].each do |y|
    y_loc = location[0] + y
    [-1, 1].each do |x|
      x_loc = location[1] + x
      root.add_link(Node.new([x_loc, y_loc])) if valid_move?([x_loc, y_loc])
    end
  end
  root
end

# array = array.new(8) { array.new(8) { 0 } }
puts 'Test at [3, 3]:'
node = build_graph([3, 3])
node.print_links

puts 'Test at [0, 0]:'
node2 = build_graph([0, 0])
node2.print_links
