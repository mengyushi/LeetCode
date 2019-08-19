class Solution(object):
    def pancakeSort(self, A):
        """
        :type A: List[int]
        :rtype: List[int]
        """
        if A == (A[:]).sort():
            return [] 
        
        result = []
        i = len(A)-1
        # print(A)
        while i > 0:
            print(A[i],max(A[:i+1]))
            if A[i]!=max(A[:i+1]):
                
                if A.index(max(A[:i+1]))!=0:
                    j = A.index(max(A[:i+1]))
                    result.append(j+1)
                    left = A[:j+1]
                    left.reverse()

                    A = left+A[j+1:]
                    # print(A)
                
                result.append(i+1)
                left = A[:i+1]
                left.reverse()
                A = left+A[i+1:]
                # print(A)
                
            i-=1
                
                
        return result
        
        
