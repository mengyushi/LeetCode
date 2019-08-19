# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def recover_tree(root)
    summary = [[],[]]
    inorder_traversal(root,summary)
    true_order = summary[0].sort
    
    summary[1].each_with_index do |node,idx|
        if node.val!=true_order[idx]
            node.val = true_order[idx]
        end
    end
    
    return root
    
end

def inorder_traversal(root,summary)
    
    inorder_traversal(root.left,summary) if root.left
    summary[0] << root.val
    summary[1] << root
    inorder_traversal(root.right,summary) if root.right
    
end 
    
