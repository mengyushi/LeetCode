# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
    # could have max (n/2).floor 2-steps
    # 3 => 2 1
    #   => 1 1 1 
    
    comb = (n/2).floor
    
    if comb>0 
        result = 1
        (1..comb).each do |i|
            # pick i from n-i
            result += (Math.gamma(n-i+1))/(Math.gamma(n-2*i+1)*Math.gamma(i+1))
        end
        return result.round
    else
        return 1 
    end
    
end
