# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
    return head if head.nil? || k==1
    # pick first k
    pointer = head
    idx = 0
    array = Array.new
    while !pointer.nil? && idx < k
        array << pointer
        pointer = pointer.next
        idx+=1
    end
    if idx < k
        return head
    else
        reversed = reverse(array)
        return append(reversed, reverse_k_group(pointer, k))
    end 
end

def reverse(array)
    array.reverse!
    head = array.first
    result = head
    array.shift
    array.each do |n|
        n.next = nil
        head.next = n
        head = head.next
    end
    return result
end

def append(left,right)
    return left if right.nil?
    return right if left.nil?
    head = left
    pointer = left
    while !pointer.next.nil?
        pointer = pointer.next
    end
    pointer.next = right
    return head
end
