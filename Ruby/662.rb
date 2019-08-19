# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def width_of_binary_tree(root)
    queue = [[root,0,0]]
    
    curr_max = nil
    curr_first = nil
    curr_depth = nil
    
    while !queue.empty?
        
        node, depth, pos = queue.shift
        
        if node
            p [node.val, "at", depth, pos]
            queue << [node.left,depth+1, pos*2]
            queue << [node.right,depth+1, pos*2+1]
        else
            p [nil, "at", depth, pos]
        end
        
        

        
        if curr_depth!=depth
            curr_depth = depth
            curr_first = nil
        end
        
        if node && curr_first.nil?
            curr_first = pos
        end
        
        if curr_first && node
            curr_width = pos - curr_first +1
            if curr_max.nil?
                curr_max = curr_width
            elsif curr_max < curr_width
                curr_max = curr_width
            end
        end
    end
    
    return curr_max
    
end
