# @param {Integer[]} hours
# @return {Integer}
def longest_wpi(hours)
    pre = {}
    max = 0
    sum = 0
    curr_interval = nil
    result = [0]
    
    pre[0] = 0
    
    hours.each_with_index do |h,i|
        if h > 8
            sum+=1
            
            if curr_interval
                curr_interval += 1
                curr_interval = [curr_interval,i+1-pre[sum-1]+result[pre[sum-1]]].max if pre.has_key?(sum-1)
            else
                curr_interval = i+1-pre[sum-1]+result[pre[sum-1]] if pre.has_key?(sum-1)
            end            
            
            pre[sum] = i+1 unless pre.has_key?(sum)
            
            max = [max,curr_interval].max if curr_interval
        else
            sum-=1
            if pre.has_key?(sum-1)
                curr_interval = i+1-pre[sum-1]+result[pre[sum-1]]
            else
                curr_interval = nil
            end
            pre[sum] = i+1 unless pre.has_key?(sum)
            max = [max,curr_interval].max if curr_interval
        end
        
    if curr_interval
        result << curr_interval
    else
        result << 0
    end
        
    print(h," ",sum," ",result.last," ",max, "\n")
        
    end
    return max
end
