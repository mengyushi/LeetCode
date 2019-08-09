# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def mergeTwoLists(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        if l1==None:
            return l2
        elif l2==None:
            return l1
        
        pointer1 = l1
        pointer2 = l2
        
        result = None
        
        while (pointer1 and pointer2):
            if result:
                if pointer1.val < pointer2.val:
                    result.next = pointer1
                    result = result.next
                    pointer1 = pointer1.next
                else:
                    result.next = pointer2
                    result = result.next
                    pointer2 = pointer2.next
                
            else:
                if pointer1.val < pointer2.val:
                    result = pointer1
                    pointer1 = pointer1.next
                else:
                    result = pointer2
                    pointer2 = pointer2.next
                
                head = result
        
        if pointer1:
            result.next = pointer1
        elif pointer2:
            result.next = pointer2
        else:
            result.next = None
            
        return head
        
            
