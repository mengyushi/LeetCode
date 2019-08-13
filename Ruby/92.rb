# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} m
# @param {Integer} n
# @return {ListNode}
def reverse_between(head, m, n)
    a = []
    pointer = head
    while !pointer.nil?
        a << pointer
        pointer = pointer.next
    end
    (m..(m+n)/2).step(1) do |i|
        p [i,n-(i-m)]
        a[i-1],a[n-(i-m)-1] = a[n-(i-m)-1],a[i-1]
    end
    (0..a.size-1).each do |i|
        a[i].next = a[i+1]
    end
    a.last.next = nil
    return a.first
end
