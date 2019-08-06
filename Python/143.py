# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def reorderList(self, head):
        """
        :type head: ListNode
        :rtype: None Do not return anything, modify head in-place instead.
        """
        if head == None:
            return head
        nodes = []
        pointer = head
        while pointer:
            nodes.append(pointer)
            pointer = pointer.next
        
        first = nodes[:(len(nodes)+1)//2]
        second = nodes[(len(nodes)+1)//2:]
        second.reverse()
       
        root =  first[0]
        
        pointer = first.pop(0)
        to_tail = True
        
        while len(first) > 0 or len(second)>0:
            if to_tail:
                pointer.next = second.pop(0)
                pointer = pointer.next
                to_tail = False
            else:
                pointer.next = first.pop(0)
                pointer = pointer.next
                to_tail = True       
                
        pointer.next = None
        return root
            
        
