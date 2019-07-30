# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
    
    val = nil
    i = 0
    while i < nums.size
        if nums[i] == val
            nums.delete_at(i)
        else
            val = nums[i]
            i+=1
        end
    end
    
end
