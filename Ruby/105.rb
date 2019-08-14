# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}

def build_tree(preorder, inorder)
    
    return nil if preorder.empty? or inorder.empty?
    
    root = TreeNode.new(preorder.first)
    idx = inorder.find_index(preorder.first)
    preorder.shift

    root.left = build_tree(preorder, inorder.slice(0..(idx-1))) unless idx==0
    root.right = build_tree(preorder, inorder.slice((idx+1)..-1)) unless idx==inorder.size-1
    
    return root
    
end
