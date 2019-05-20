def min_cost_climbing_stairs(cost)
    results = []
    [*0..cost.length-1].reverse.each do |i|
        
        if (cost.length-i <= 2)
            results = [cost[i]] + results
        else
            results = [cost[i] + [results[0],results[1]].min] + results
        end
                
            
    end
       p results
       return [results[0],results[1]].min 
end