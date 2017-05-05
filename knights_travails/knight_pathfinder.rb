require_relative 'tree_node'
require 'byebug'

class KnightPathFinder
  attr_reader :start_position, :visited_positions, :move_tree

  def self.valid_moves(pos)
    # self.new(pos)
    #debugger
    x, y = pos
    moves = [
      [x - 1, y + 2],
      [x - 1, y - 2],
      [x + 1, y + 2],
      [x + 1, y - 2],
      [x - 2, y + 1],
      [x - 2, y - 1],
      [x + 2, y + 1],
      [x + 2, y - 1]
    ]

    moves.select do |pair|
      pair.all? { |num| num.between?(0,7) }
    end
  end

  def initialize(start_position)
    @start_position = start_position
    @move_tree = []
    @visited_positions = [start_position]
  end

  def build_move_tree
    queue = [start_position]
    until queue.empty?
      first_node = queue.shift
      move_tree << PolyTreeNode.new(first_node)
      queue.concat(new_move_positions(first_node))
    end

    puts "tree constructed!"
  end

  def new_move_positions(pos)
    valid = self.class.valid_moves(pos)
    valid.reject! { |move| visited_positions.include?(move) }
    visited_positions.concat(valid)
    valid
  end
end

if __FILE__ == $PROGRAM_NAME
  k = KnightPathFinder.new([0,0])
  k.build_move_tree
  p k.move_tree
end
