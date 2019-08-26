# """
# This is MountainArray's API interface.
# You should not implement it, or speculate about its implementation
# """
#class MountainArray(object):
#    def get(self, index):
#        """
#        :type index: int
#        :rtype int
#        """
#
#    def length(self):
#        """
#        :rtype int
#        """

class Solution(object):
    def findInMountainArray(self, target, mountain_arr):
        """
        :type target: integer
        :type mountain_arr: MountainArray
        :rtype: integer
        """
        peak,peak_value = find_peak(mountain_arr)
        print(peak_value)
        
        if target == peak_value:
            return peak
        elif target > peak_value:
            return -1
        
        result = None
        # find before peak
        if peak<=3:
            for i in range(0,peak):
                if mountain_arr.get(i) == target:
                    return i
        else:
            if mountain_arr.get(0) == target:
                return 0
            else:
                m = peak//2
                l,r = 0,peak-1

                while l<r:
                    if mountain_arr.get(m) == target:
                        result = m
                        break
                    elif mountain_arr.get(m) < target:
                        l = m
                        m = (l+r+1)//2
                    else:
                        r = m-1
                        m = (l+r+1)//2
        
        if result:
            return result
        else:
            # find after peak
            
            n = mountain_arr.length()
            
            if (n-1)-peak < 3:
                for i in range(peak+1,n):
                    if mountain_arr.get(i) == target:
                        result = i 
            else:
                l,r = peak, n-1
                m = (l+r+1)//2
                
                while l<r:
                    
                    if mountain_arr.get(m) == target:
                        result = m
                        break
                    elif mountain_arr.get(m) > target:
                        l = m
                        m = (l+r+1)//2            
                    else:
                        r = m-1
                        m = (l+r+1)//2            
            
            if result:
                return result
            else:
                return -1
        

def find_peak(mountain_arr):
    
    n = mountain_arr.length()
    
    left = 0
    right = n-1    
    
    m = n//2
    l,r = m-1, m+1
    v_m, v_l, v_r = mountain_arr.get(m), mountain_arr.get(l), mountain_arr.get(r)
    
    while True:
        if v_l < v_m and v_m > v_r:
            return m,v_m
        
        elif v_l < v_m < v_r:
            left = m
            m = (left+right)//2
            l,r = m-1, m+1
            v_m, v_l, v_r = mountain_arr.get(m), mountain_arr.get(l), mountain_arr.get(r)
        else:
            right = m
            m = (left+right)//2
            l,r = m-1, m+1
            v_m, v_l, v_r = mountain_arr.get(m), mountain_arr.get(l), mountain_arr.get(r)
        
    
    
