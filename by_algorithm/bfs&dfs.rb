# Sample Question: 101. Symmetric Tree

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
	return is_symmetric_BFS(root)
	# return is_symmetric_DFS(root)
end

def is_symmetric_BFS(root)
    return true unless root
    
    check_l = [root.left]
    check_r = [root.right]
    
    # BFS Checking Mirror 
    
    until check_l.empty?
        l = check_l.shift
        r = check_r.shift
        
        if l.nil?
            return false unless r.nil?
        else
            return false if r.nil?
            return false if l.val!=r.val
            check_l << l.left
            check_l << l.right
            check_r << r.right
            check_r << r.left
        end
        
        
    end
    
    return true
    
end