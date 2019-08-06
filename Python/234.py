# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def isPalindrome(self, head):
        """
        :type head: ListNode
        :rtype: bool
        """
        vals = []
        pointer = head
        while pointer:
            vals.append(pointer.val)
            pointer = pointer.next
        pre = vals[:]
        vals.reverse()
        return vals == pre
