# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
    
    start_of_zeros = -1
    
    (0..nums.length-1).each do |i|
        case start_of_zeros
            when -1 then 
                if nums[i] == 0
                    start_of_zeros = i
                end
            else 
                if nums[i]!=0
                    nums[start_of_zeros] = nums[i]
                    nums[i] = 0
                    start_of_zeros += 1
                end
            end
    end
end
