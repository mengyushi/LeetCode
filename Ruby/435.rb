# @param {Integer[][]} intervals
# @return {Integer}
def erase_overlap_intervals(intervals)
    
    return 0 if intervals.empty?

    intervals.sort_by! {|x| x.last}
    last = intervals.first.last
    
    new_intervals = intervals.select {|x| x.first >= last}
    
    return  intervals.size - new_intervals.size - 1 + erase_overlap_intervals(new_intervals)
    
end
