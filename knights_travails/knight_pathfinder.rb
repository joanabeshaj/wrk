require_relative 'tree_node'

class KnightPathFinder
  attr_reader :start_position, :visited_positions

  def self.valid_moves(pos)
    # self.new(pos)
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
    @move_tree = self.build_move_tree
    @visited_positions = [start_position]
    # @possible_moves = KnightPathFinder.valid_moves(start_position)
  end

  def build_move_tree

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
  k.new_move_positions([0,0])
  p k.visited_positions
end
