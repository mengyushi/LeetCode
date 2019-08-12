# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

    
class Solution(object):
    def merge(self,left,right):
        if left == None:
            return right
        elif right == None:
            return left
        
        l = left
        r = right
        result = None
        
        while (l!=None and r!=None):
            if l.val < r.val:
                curr = l
                l = l.next
            else:
                curr = r
                r = r.next
            
            curr.next = None
            if result == None:
                result = curr
                head = result
            else:
                result.next = curr
                result = result.next
                
        if l!=None:
            result.next = l
        elif r!=None:
            result.next = r
        
        return head
        
    def sortList(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        # merge sort
        if head == None:
            return head
        elif head.next == None:
            return head
        else:
            length = 0
            pointer = head
            
            while pointer!=None:
                length+=1
                pointer = pointer.next
            
            count = 1
            pointer = head
            
            while count < ((length+1)/2):
                pointer = pointer.next
                count+=1
            
            right = pointer.next
            pointer.next = None
            left = head
            # print(left,right)
            
            left = self.sortList(left)
            right = self.sortList(right)

            return self.merge(left,right)
            
