# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
    [*1..nums.length-1].each do |i|
        case nums[i-1]>0
            when true then nums[i] = nums[i]+nums[i-1]
            end
    end
    return nums.max
end