# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def removeNthFromEnd(self, head, n):
        """
        :type head: ListNode
        :type n: int
        :rtype: ListNode
        """
        
        def count_length(head):
            count = 0
            pointer = head
            while pointer:
                count+=1
                pointer = pointer.next
            return count
        
        l = count_length(head)
        
        pointer = head
        count = 0
        
        if l==n:
            return head.next
        
        while pointer:      
            count+=1
            if count == (l-n):
                pointer.next = pointer.next.next
                return head
            pointer = pointer.next
                
            
        
