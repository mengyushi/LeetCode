# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} pre
# @param {Integer[]} post
# @return {TreeNode}
def construct_from_pre_post(pre, post)
    return nil if pre.empty?
    root = TreeNode.new(pre.first)
    return root if pre.size == 1
    
    # case pre / post size >= 2
    idx_pre = 0
    
    # find left branch post
    left_val = pre[1]
    
    left_end_idx = post.find_index(left_val)
    post_left = post.slice(0..left_end_idx)
    
    # find right branch post
    post_right = post.slice(left_end_idx+1..-2)
    
    # find left branch pre
    right_val = post_right.last
    
    if right_val.nil?
        pre_left = pre.slice(1..-1) 
        root.left = construct_from_pre_post(pre_left, post_left)
    else
        right_first_idx = pre.find_index(right_val)
        pre_left = pre.slice(1..right_first_idx-1) 
        # find right branch post
        pre_right = pre.slice(right_first_idx..-1) 
        root.left = construct_from_pre_post(pre_left, post_left)
        root.right = construct_from_pre_post(pre_right, post_right) 
    end
    
    return root
    
end
