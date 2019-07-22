# Pure Math

# Given furthest jumping point =>
# if it can reach further true points
# it has to be able to reach the first true point

# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
    return false if nums.size == 0 || nums.nil?
    return true if nums.size == 1
    
    pos = nums.size-1
    
    (nums.size-2).downto(0) do |i|
        jump = nums[i]
        if jump+i >= pos
            pos = i
            return true if pos == 0
        end
    end
    return false
end
