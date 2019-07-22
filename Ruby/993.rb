# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} x
# @param {Integer} y
# @return {Boolean}
def is_cousins(root, x, y)
    return true if x==y 
    return false if root.val == x || root.val == y
    
    result = {}
    result[x] = nil
    result[y] = nil
    
    to_check = [[root,0]]
    
    while !to_check.empty?
        pointer,level = to_check.shift
        return false if (pointer.left && pointer.right && [pointer.left.val,pointer.right.val].sort == [x,y].sort)
        
        if pointer.left
            to_check << [pointer.left,level+1]
            result[pointer.left.val] = level+1 if pointer.left.val == x || pointer.left.val == y
            return true if result[x] && result[y] && result[x]==result[y]
            return false if result[x] && result[y] && result[x]!=result[y]
        end
        if pointer.right
            to_check << [pointer.right,level+1] 
            result[pointer.right.val] = level+1 if pointer.right.val == x || pointer.right.val == y
            return true if result[x] && result[y] && result[x]==result[y]
            return false if result[x] && result[y] && result[x]!=result[y]
        end
    end

end
