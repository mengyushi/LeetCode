# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

class BSTIterator

=begin
    :type root: TreeNode
=end
    def initialize(root)
        @root = root
    end


=begin
    @return the next smallest number
    :rtype: Integer
=end
    def next()
        pointer = @root
        pre = nil
        while !pointer.left.nil?
            pre = pointer
            pointer = pointer.left
        end
        
        if pointer.right
            
            case 
                when pre.nil? then @root = pointer.right
                else
                    pre.left = pointer.right 
                end
        else
            case 
                when pre.nil? then @root = nil
                else
                    pre.left = nil
                end
        end
        
        return pointer.val 
    end


=begin
    @return whether we have a next smallest number
    :rtype: Boolean
=end
    def has_next()
        return !@root.nil?
    end


end

# Your BSTIterator object will be instantiated and called as such:
# obj = BSTIterator.new(root)
# param_1 = obj.next()
# param_2 = obj.has_next()
