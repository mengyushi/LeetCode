# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[][]}
def vertical_traversal(root)
    return [] unless root
    all_positions = {}
    position(root,[0,0],all_positions)
    result = []
    all_positions.sort.each do |_,x|
        result << x.sort.reverse.to_h.values.flatten
    end
    return result
    
end

def position(root,position,all_positions)
    x,y = position
    
    if all_positions.has_key?(x)
        if all_positions[x].has_key?(y)
            all_positions[x][y] = (all_positions[x][y]<<root.val).sort
        else
            all_positions[x][y] = [root.val]
        end
    else
        all_positions[x] = {y=>[root.val]}
    end
    
    
    position(root.left,[x-1,y-1],all_positions) if root.left
    position(root.right,[x+1,y-1],all_positions) if root.right
    
end
