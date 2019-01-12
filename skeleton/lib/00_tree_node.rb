class PolyTreeNode
    attr_reader :children, :value, :parent

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(p_node)
        #find out parent
        old_parent = self.parent
        #if parent exists, then remove self from old parent child list 
        old_parent.children.delete(self) if old_parent
        
        @parent = p_node
        #set child attribute of p_node
   
        p_node.children.push(self) unless p_node.nil? || p_node.children.include?(self) 
    end

    def add_child(c_node)
        c_node.parent = self
    end

    def remove_child(c_node)
        raise "error" unless c_node.parent
        c_node.parent = nil
    end

    def dfs(target)
        return if self.children.empty?

        if self.value == target
            self
        else
            self.children.each do |child|
                child.dfs(target)
            end
        end
    end 

end