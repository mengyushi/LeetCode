# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    def inorder(self, root):
        """
        :type root: TreeNode
        :rtype: List[int]
        """
        if root:
            self.inorder(root.left)
            result.append(root.val)
            self.inorder(root.right)
            
    def inorderTraversal(self, root):
        global result
        result = []
        self.inorder(root)
        return result
