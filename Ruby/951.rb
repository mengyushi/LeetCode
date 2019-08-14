# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {Boolean}
def flip_equiv(root1, root2)
    
    return true if root1 == root2 
    return false if ((root1.nil? && !root2.nil?) || (!root1.nil? && root2.nil?))
    
    return false if root1.val!=root2.val
    
    return true if (root1.val == root2.val && root1.left == root2.right && root1.right == root2.left)
    
    return (flip_equiv(root1.left, root2.left) && flip_equiv(root1.right, root2.right)) || (flip_equiv(root1.right, root2.left) && flip_equiv(root1.left, root2.right))
    
end
