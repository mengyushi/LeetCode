# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} key
# @return {TreeNode}
def delete_node(root, key)
    if root.nil?
        return nil
    
    elsif root.val == key
        case
            when root.right.nil?
            then return root.left
                
            when !root.right.nil?
            then
                pointer = root.right
                
                while !pointer.left.nil?
                    pointer = pointer.left
                end
                
                root.val = pointer.val
                
                root.right = delete_node(root.right,pointer.val)
                
                return root
                
            end
            
    else
        root.left = delete_node(root.left, key)
        root.right = delete_node(root.right, key)
        return root
    end
end
