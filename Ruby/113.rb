# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} sum
# @return {Integer[][]}
def path_sum(root, sum)
    return [] unless root
    result = []
    path = []
    all_path(root,sum,path,result)
    return result
end

def all_path(root,sum,path,result)
    
    if root.left.nil? && root.right.nil?
        if root.val == sum
            path << root.val
            result << path
        end
    else
        path << root.val
        all_path(root.left,sum-root.val,path+[],result) if root.left
        all_path(root.right,sum-root.val,path+[],result) if root.right
    end
end
