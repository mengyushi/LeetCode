# @param {Integer[]} nums
# @param {Integer} k
# @return {Float[]}
def median_sliding_window(nums, k)
    window = nums.slice(0..k-1)
    result = []
    while result.size < (nums.size - k +1)
        l = nums[result.size]
        r = nums[result.size + k]
        
        window.sort!
        curr = nil
        case k%2
            when 0 then curr = (window[k/2-1]+window[k/2])/2.to_f
            when 1 then curr = window[k/2].to_f
            end
            
        result << curr
        
        window.delete_at(window.index(l))
        window << r
        
    end
    return result
end
