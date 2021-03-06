# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def addTwoNumbers(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        if l1 == None:
            return l2
        elif l2 == None:
            return l1
        
        n1 = ""
        
        pointer = l1
        while pointer!= None:
            n1 += str(pointer.val)
            pointer = pointer.next
        print(n1)
        n2 = ""
        pointer = l2
        while pointer!= None:
            n2 += str(pointer.val)
            pointer = pointer.next
        print(n2)
        
        result = str(int(n1)+int(n2))
        print(result)
        
        head = None
        pre = None
        
        for c in result:
            n = ListNode(c)
            if head == None:
                head = n
                pre = head
            else:
                n.next = None
                pre.next = n
                pre = pre.next
                
        return head        
