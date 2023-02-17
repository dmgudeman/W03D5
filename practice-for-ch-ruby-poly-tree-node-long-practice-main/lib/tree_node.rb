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
end