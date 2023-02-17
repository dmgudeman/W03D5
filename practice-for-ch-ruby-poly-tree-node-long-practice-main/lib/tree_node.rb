require "byebug"

class PolyTreeNode

    attr_reader :value, :children, :parent
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(node)
        # debugger
        return if parent == node
        if self.parent
            self.parent.children.delete(self)
        end

        @parent = node
        self.parent.children << self unless self.parent.nil?
    end
end