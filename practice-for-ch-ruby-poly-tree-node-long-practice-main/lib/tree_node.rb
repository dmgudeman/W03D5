require "byebug"

class PolyTreeNode

    attr_reader :value, :children, :parent
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(new_node)
        # debugger
        return if parent == new_node
        if self.parent
            self.parent.children.delete(self)
        end

        @parent = new_node
        self.parent.children << self unless self.parent.nil?
    end

    def add_child(child_node)
        child_node.parent = self
    end
    
    def remove_child(child_node)
        raise "I'm not a child!" if child_node.parent.nil?
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value

        self.children.each do | child |
            result = child.dfs(target_value)
            return result unless result.nil?
        end
        nil
    end

    def bfs(target_value)

        queue = [self]

        until queue.empty?
            node = queue.shift
            return node if node.value == target_value
            node.children.each {|child| queue << child}
        end
        nil
    end


            



end