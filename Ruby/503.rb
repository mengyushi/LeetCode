# @param {Integer[]} nums
# @return {Integer[]}
def next_greater_elements(nums)
    max = nums.max
    temp = nums+nums
    result = []
    
    (0..nums.size-1).step(1) do |i|
        if nums[i] == max
            result << -1 
        else
            temp.slice(i+1..-1).each do |k|
                if k > nums[i]
                    result << k
                    break
                end
            end
        end
    end
    return result
end
