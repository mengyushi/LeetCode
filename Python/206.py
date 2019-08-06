# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def reverseList(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        if not head:
            return head
        
        def add_to_end_of_list(head,node):
            pointer = head
            while pointer.next:
                pointer = pointer.next
            pointer.next = node
            return head
            
        if head.next:
            remained = self.reverseList(head.next)
            head.next = None
            return add_to_end_of_list(remained,head)
            
        else:
            return head
        
        
