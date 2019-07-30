# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def check_subarray_sum(nums, k)
    
    if k==0
        (nums.size-1).times do |i|
            if nums[i] == 0 && nums[i+1]==0
                return true
            end
        end
        return false
        
    else     
        
        return true if nums.size == 2 && nums.sum%k == 0
        
        mods = []
        nums.each do |n|
            if mods.size == 0
                mods << n%k
            else
                mods << (mods.last+n)%k

                if mods.size >=3
                    return true if mods.last==0
                    return true if mods[0..-3].include?(mods.last) 
                end
            end
        end

        return false
    end
end
