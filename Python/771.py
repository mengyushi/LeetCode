class Solution:
    def numJewelsInStones(self, J: str, S: str) -> int:
        result = 0
        for x in list(S):
            if x in list(J):
                result+=1
        return result
        