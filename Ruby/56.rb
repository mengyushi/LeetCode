# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
    return intervals if intervals.size <= 1 
    0.upto(intervals.size-2) do |i|
        (i+1).upto(intervals.size-1) do |j|
            if ((intervals[i][1] >= intervals[j][0] && intervals[i][0] <= intervals[j][0]) || (intervals[j][1] >= intervals[i][0] && intervals[j][0] <= intervals[i][0]))
                left = intervals[i]
                right = intervals[j]
                
                new = [[intervals[i][0],intervals[j][0]].min,[intervals[i][1],intervals[j][1]].max]
                intervals.delete(left)
                intervals.delete(right)
                
                intervals << new
                
                return merge(intervals)
            end
        end
    end
    return intervals.sort!
end
