# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarray_sum(nums, k)
    result = {}
    result[0] = 1
    s = 0
    count = 0
    nums.each do |n|
        s+=n
        if result.has_key?(s-k)
            count+=result[s-k]
        end
        result[s] = result.has_key?(s) ? result[s]+1:1 
    end
    return count
end
