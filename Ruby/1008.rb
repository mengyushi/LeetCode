# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} preorder
# @return {TreeNode}
def bst_from_preorder(preorder)
    # root [left(<root)] [right(>root)]
    
    return nil if preorder.empty?
    
    root_val = preorder.shift
    root = TreeNode.new(root_val)
    
    left_vals = preorder.select{|x| x < root_val}
    right_vals = preorder.select{|x| x > root_val}
    
    root.left = bst_from_preorder(left_vals)
    root.right = bst_from_preorder(right_vals)
    
    return root
    
end
