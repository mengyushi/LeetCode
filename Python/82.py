# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def deleteDuplicates(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        
        pre = None
        result = None
        result_head = None
        
        pointer = head
        while pointer!=None:
            # print("Now at ",pointer.val)
            # find first
            if result == None:
                # print("find first")
                if pointer and (pointer.next == None or pointer.val!=pointer.next.val) and (pre == None or pre.val!=pointer.val):
                    # print("Yes")
                    pre = pointer
                    pointer = pointer.next
                    result = pre
                    result.next = None
                    result_head = result
                else:
                    # print("No")
                    pre = pointer
                    pointer = pointer.next
            # find follows
            else:
                # print("find follows")
                if pointer and (pointer.next == None or pointer.val!=pointer.next.val) and pre.val!=pointer.val:
                    # print("Yes")
                    pre = pointer
                    result.next = pointer
                    pointer = pointer.next
                    result = result.next
                    result.next = None
                else:
                    # print("No")
                    pre = pointer
                    pointer = pointer.next
                    
                    
        return result_head