# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}
def lca_deepest_leaves(root)
    return lca(root)[1]
end

def lca(root)
    return [0,root] unless root
    h1,lca1 = lca(root.left)
    h2,lca2 = lca(root.right)
    
    return [h1+1,lca1] if h1 > h2
    return [h2+1,lca2] if h1 < h2
    return [h1+1,root]
end
