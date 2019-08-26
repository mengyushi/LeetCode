# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
    return [] if nums.size < 3

    
    
    return [[0,0,0]] if nums.uniq == [0]
    
        
    result = []
        
    nums.sort!
        
    (1..nums.size-2).step(1) do |m|
        l = m-1
        r = m+1
        
        while (l>=0 && r<nums.size)
            
            sum = [nums[l],nums[m],nums[r]].sum
            
            case 
                when sum == 0 
                then 
                    result << [nums[l],nums[m],nums[r]]
                    l = l-1

                when sum > 0 then l = l-1
                when sum < 0 then r = r+1
                end
                
        end
    end
            
    return result.uniq
end
