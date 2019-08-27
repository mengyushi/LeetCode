# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
    nums.sort!
    result = nums.slice(0..2).sum
    0.upto(nums.size-2) do |i|
        j = i+1
        k = nums.size-1
        while j < k
            sum = nums[i]+nums[j]+nums[k]
            return sum if sum == target
            result = sum if (sum-target).abs < (result-target).abs
            if sum < target 
                j+=1
            else
                k-=1
            end
        end
    end
    result
end
