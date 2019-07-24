# @param {Integer[]} gas
# @param {Integer[]} cost
# @return {Integer}
def can_complete_circuit(gas, cost)
    return -1 if gas.sum < cost.sum
    result = []
    gas.each_index { |i| result << gas[i]-cost[i]}
    
    return 0 if circ(result)
    
    1.upto(result.size) do |i|
        if circ(result.slice(i..-1) + result.slice(0..i))
            return i 
        end
    end
    return -1
end

def circ(array)
    start = 0
    array.each do |a|
        start+=a
        return false if start < 0 
    end
    return true
end
