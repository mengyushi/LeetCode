# @param {Integer[][]} a
# @param {Integer[][]} b
# @return {Integer[][]}
def interval_intersection(a, b)
    result = []
    while !a.empty? && !b.empty?
        p_a = a.first
        p_b = b.first
        
        if [p_a.last,p_b.last].min >= [p_a.first,p_b.first].max
            result << [[p_a.first,p_b.first].max,[p_a.last,p_b.last].min]
        end
        
        if p_a.last > p_b.last
            b.shift
        else
            a.shift
        end
        
    end
    return result
end
