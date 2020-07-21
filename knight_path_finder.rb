require_relative "node.rb"

module Knight_Path_Finder
    def knight_moves(coor1, coor2)
        # using a breadth first generation and search the algorithim constructs a tree of every possible path until the final position is found
        start = Node.new(coor1)
        finish = Node.new(coor2)
        current_nodes = Array.new(1, start)
        new_nodes = []
        until current_nodes.include?(finish)
            current_nodes.each do |node|
                new_nodes += generate_children(node)
            end
            current_nodes = new_nodes
            new_nodes = []
        end
        current_node = current_nodes.find { |node| node == finish}
        path = Array.new(1, current_node.value)
        until current_node.parent == nil
            current_node = current_node.parent
            path.append(current_node.value)
        end
        return path.reverse
    end

    def generate_children(node)
        # Accepts a node and generates the possible paths from the nodes location and then appends child nodes with each possible path
        # returns an array of these new nodes
        new_locations = generate_next_possible_steps(node.value)
        nodes = []
        new_locations.each do |location|
            new_node = Node.new(location)
            node.append_child(new_node)
            nodes.append(new_node)
        end
        return nodes
    end

    def generate_next_possible_steps(value)
        # accepts a value and generates the next legal steps that the knight could make
        valid_moves = [[2,1],[2,-1],[1,2],[-1,2],[-2,1],[-2,-1],[1,-2],[-1,-2]]
        next_steps = []
        valid_moves.each do |move|
            x = value[0] + move[0]
            y = value[1] + move[1]
            if((x >= 0 && x < 8) && (y >= 0 && y < 8))
                next_steps.append([x,y])
            end
        end
        return next_steps
    end
end