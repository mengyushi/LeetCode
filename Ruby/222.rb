# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def count_nodes(root)
    return 0 unless root
    height = 0
    height = find_height(root,height)
    result = 0
    (0..(height-1)).step(1) do |i|
        result += 2**i
    end
    return result + count_leafs(root,0, height)
end

def find_height(root,height)   
    if root.left
        height = height+1
        find_height(root.left,height)
    else
        return height
    end
end

def count_leafs(root,curr_height,total_height)
    if root.left.nil? && root.right.nil?
        return 1 if curr_height == total_height
        return 0
    else
        return count_leafs(root.right,curr_height+1, total_height) if root.left.nil?
        return count_leafs(root.left,curr_height+1, total_height) if root.right.nil?
        return count_leafs(root.left,curr_height+1, total_height)+count_leafs(root.right,curr_height+1, total_height)
    end
end
