# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
    if nums == nums.sort.reverse
        nums.reverse!
    else
        # find dec
        l = nil
        (nums.size-2).downto(0) do |i|
            if nums[i]<nums[i+1]
                l = i
                break
            end
        end 
        
        r = nil
        (l+1).upto(nums.size-1) do |j|
            if r.nil? || (nums[j]-nums[l] > 0 && nums[j]-nums[l] < nums[r]-nums[l])
                r = j
            end
        end
        
        v_l,v_r = nums[l],nums[r]
        nums[l],nums[r] = v_r, v_l
        
        new_array = nums.slice(0..l) + nums.slice(l+1..-1).sort
        
        (l+1).upto(nums.size-1) do |k|
            nums[k] = new_array[k]
        end 
        
    end
    
end
