# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def swapPairs(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        if head == None or head.next == None:
            return head
        else:
            tails = head.next.next
            new_head = head.next
            new_second = head
            new_head.next = new_second
            new_second.next = self.swapPairs(tails)
            
            return new_head
        
        
        
