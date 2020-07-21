module Knight_Path_Finder
    class Node
        attr_reader :value, :children, :parent
        def initialize(value)
            # value must be an array containing positive integer coordinates from 0 - 7
            if(value.class != Array)
                raise "Node value must be an array"
            end
            if(value.length != 2)
                raise "Coordinate must be two integers"
            end
            if((value[0] > 7 || value[0] < 0) || (value[1] > 7 || value[1] < 0))
                raise "Values must be 0 - 7 inclusively"
            end
            @value = value
            @children = []
            @parent = nil
        end

        def reset_parent
            @parent = nil
        end

        def set_parent(node)
            if(node.class != Node)
                raise "The parent must be a node"
            end
            @parent = node
        end

        def append_child(node)
            if(node.class != Node)
                raise "Children must be nodes"
            end
            @children.append(node)
            node.set_parent(self)
        end

        def ==(other)
            return false if(other.class != Node)
            self.value == other.value
        end
    end
end