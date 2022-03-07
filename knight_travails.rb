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
def build_graph(root, board)
  # X-Axis
  [-2, 2].each do |x|
    x_loc = root.data[0] + x
    [-1, 1].each do |y|
      y_loc = root.data[1] + y
      root.add_link(board[x_loc][y_loc]) if valid_move?([x_loc, y_loc])
    end
  end

  # Y-Axis
  [-2, 2].each do |y|
    y_loc = root.data[0] + y
    [-1, 1].each do |x|
      x_loc = root.data[1] + x
      root.add_link(board[x_loc][y_loc]) if valid_move?([x_loc, y_loc])
    end
  end
end

# Creates 8x8 array of Nodes
def create_board
  all_nodes = Array.new(8) { Array.new(8) { nil } }

  (0..7).to_a.each do |x|
    (0..7).to_a.each do |y|
      all_nodes[x][y] = Node.new([x, y])
    end
  end

  all_nodes.each do |array|
    array.each do |node|
      build_graph(node, all_nodes)
    end
  end

  all_nodes
end

# Finds and prints shortest route from start to goal
def find_route(start, goal)
  # todo
end

board = create_board

puts board[0][0].links[0].data

puts 'board[0][0] links:'
board[0][0].print_links
