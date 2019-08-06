# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def middleNode(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        pointer = head
        l = 0
        while pointer:
            l+=1
            pointer = pointer.next
        
        pos = l//2
        
        pointer = head
        i = 0
        while i<pos:
            pointer = pointer.next
            i+=1
        
        return pointer
