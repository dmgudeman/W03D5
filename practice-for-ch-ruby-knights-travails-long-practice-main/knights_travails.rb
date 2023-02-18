require_relative "tree_node.rb"

class KnightPathFinder
    def self.valid_moves(pos)
        x, y = pos
        moves_dict = [
            [x+1, y-2],
            [x+2, y-1],
            [x+2, y+1],
            [x+1, y+2],
            [x-1, y-2],
            [x-2, y-1],
            [x-2, y+1],
            [x-1, y+2]
        ]
        moves = moves_dict.select{ |move| move.all? {|coord| coord >= 0 && coord < 8} }  
        moves
    end
    attr_reader :considered_pos
    def initialize(start_pos)
        @start_pos = start_pos
        @considered_pos = [start_pos]
        @root_node = PolyTreeNode.new(start_pos)
        # build_move_tree(@root_node)
    end

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        valid_moves.select {|move| !considered_pos.include?(move)} 
    end

    def build_move_tree(new_node)


    end
end

knight = KnightPathFinder.new([4,4])


p knight.new_move_positions([5,6])

knight.considered_pos << [7,5]

p knight.new_move_positions([5,6])