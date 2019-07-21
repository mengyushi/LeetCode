# BFS solution
"""
# Definition for a Node.
class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children
"""
class Solution(object):
    def maxDepth(self, root):
        """
        :type root: Node
        :rtype: int
        """
        if not root:
            return 0
        
        max_height = 1
        to_visit = [[root,1]] # node, level
        
        while len(to_visit) > 0:
            node,level = to_visit.pop(0)
            for child in node.children:
                to_visit.append([child,level+1])
                if max_height < level+1:
                    max_height = level+1 
                
        return max_height
