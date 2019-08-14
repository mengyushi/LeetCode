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
def flatten(root)
    return root if root.nil?
    
    vals = []
    irt(root,vals)
    
    (0..vals.size-2).step(1) do |i|
        p vals[i].val
        vals[i].left = nil
        vals[i].right = vals[i+1]
    end
    
    vals.last.left = nil
    vals.last.right = nil
    return vals.first
end

def irt(root,vals)
    vals << root
    irt(root.left,vals) unless root.left.nil?
    irt(root.right,vals) unless root.right.nil?
end
