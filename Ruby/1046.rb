# @param {Integer[]} stones
# @return {Integer}
def last_stone_weight(stones)
    return stones.first if stones.size == 1
    return 0 if stones.size == 0
    
    stones.sort!
    x,y = [stones[-1],stones[-2]].min, [stones[-1],stones[-2]].max
    stones.pop
    stones.pop    
    
    case 
        when x == y then return last_stone_weight(stones)
        when x!=y then return last_stone_weight(stones<<(y-x))
        end
            
end
