# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def wiggle_sort(nums)
    nums.sort!
    small = nums.slice(0..(nums.size-1)/2)
    large = nums.slice((nums.size-1)/2+1..-1)
    
    (0..nums.size-1).step(1) do |i|
        if i%2 == 0
            nums[i] = small.pop
        else
            nums[i] = large.pop 
        end
    end
    
end
