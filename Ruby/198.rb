# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
    if nums.length == 0
        return 0
        
    elsif nums.length <= 2
        return nums.max
        
    else
        return [nums[0]+rob(nums[2..-1]), rob(nums[1..-1])].max
    end
    
end
