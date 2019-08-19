# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
    
    return p if find(p, q)
    return q if find(q, p)
    
    if (find(root.left, p) && find(root.left, q))
        return lowest_common_ancestor(root.left, p, q) 
    elsif (find(root.right, p) && find(root.right, q))
        return lowest_common_ancestor(root.right, p, q) 
    else
        return root
    end
    
    return root
end

def find(root,target)
    if root
        if (root == target)
            return true
        else
            return find(root.left,target) || find(root.right,target)
        end
        
    else
        return false
    end  
    
end
