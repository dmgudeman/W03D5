require_relative "tree_node.rb"

class KnightPathFinder
    def self.valid_moves(pos)
        x, y = pos
        moves = []
        moves << []
    end

    def initialize(start_pos)
        @start_pos = start_pos
        @considered_pos = [start_pos]
        @root_node = PolyTreeNode.New(start_pos)
        build_move_tree(@root_node)
    end

    def build_move_tree(new_node)

    end
end