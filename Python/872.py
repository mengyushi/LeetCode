# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    def find_leaf(self,root):
        if root == None:
            return []
        
        result = []
        to_check = [root]
        while len(to_check) > 0:
            pointer = to_check.pop()
            if pointer.left:
                to_check.append(pointer.left)
            if pointer.right:
                to_check.append(pointer.right)
            if pointer.left == None and pointer.right == None:
                result.append(pointer.val)
        # result.sort()
        return result
            
    def leafSimilar(self, root1, root2):
        """
        :type root1: TreeNode
        :type root2: TreeNode
        :rtype: bool
        """
        print(self.find_leaf(root1),self.find_leaf(root2))
        return (self.find_leaf(root1) == self.find_leaf(root2))
