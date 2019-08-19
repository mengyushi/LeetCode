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
def zigzag_level_order(root)
    return [] unless root
    
    result = {}
    BFS(root,0,result)
    
    result = result.values
    
    result.each_with_index do |row,i|
        result[i] = result[i].reverse if i%2!=0
    end
    
    return result
end

def BFS(root,level,result)
    
    if result.has_key?(level)
        result[level] << root.val
    else
        result[level] = [root.val]
    end
    
    BFS(root.left,level+1,result) if root.left
    BFS(root.right,level+1,result) if root.right
    
    
end
