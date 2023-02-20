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
    attr_reader :considered_pos, :root_node
    def initialize(start_pos)
        @start_pos = start_pos
        @considered_pos = [start_pos]
        @root_node = PolyTreeNode.new(start_pos)
        build_move_tree
    end

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        valid_moves.select {|move| !considered_pos.include?(move)} 
    end

    def build_move_tree
        queue = [self.root_node]

        until queue.empty?
            new_node = queue.shift
            valid_moves = new_move_positions(new_node.value)
            valid_moves.each do |move|
                considered_pos << move
                move_node = PolyTreeNode.new(move)
                move_node.parent = new_node
                new_node.add_child(move_node)
                queue << move_node
            end
        end
            # return node if node.value == target_value
            # node.children.each {|child| queue << child}
  
    end

    def find_path(end_pos)

        @root_node.dfs(end_pos)
        # prc ||= Proc.new{|node| node.value == end_pos}
        # return self if prc.call(self)

        # start_node.children.each do | child |
        #     result = find_path(child, end_pos, &prc) 
        #     return result unless result.nil?
        # end
        # nil
    end
end


knight = KnightPathFinder.new([4,4])

p knight.find_path([5,6])




# p knight.new_move_positions([5,6])

# knight.considered_pos << [7,5]

# p knight.new_move_positions([5,6])