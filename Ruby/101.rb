# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
    return true unless root
    return mirror(root.left,root.right)
end

def mirror(t1,t2)
    return true if t1.nil? && t2.nil?
    return false if t1.nil?||t2.nil?
    return false unless t1.val == t2.val
    return mirror(t1.right,t2.left) && mirror(t1.left,t2.right)
end
