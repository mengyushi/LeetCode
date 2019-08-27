# @param {Integer} target
# @param {Integer} start_fuel
# @param {Integer[][]} stations
# @return {Integer}
def min_refuel_stops(target, start_fuel, stations)
    dp = [start_fuel] + [0]*stations.size
    stations.size.times do |i|
        location = stations[i][0]
        capacity = stations[i][1]
        
        i.downto(0) do |t|
            if dp[t] >= location
                dp[t+1] = [dp[t+1], dp[t]+capacity].max
            end
        end
    end
    
    # p dp
    
    dp.each_with_index do |d,i|
        return i if d>=target
    end
    return -1
end
