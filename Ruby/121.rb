# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    if prices == []
        return 0
    end
    

    best_profit = 0
    curr_min = prices[0]
    curr_profit = 0
    
    prices.each do |price|
        
        if curr_min > price
            curr_min = price
            curr_profit = 0
        elsif price-curr_min > curr_profit
            curr_profit = price-curr_min
        end
        
        if curr_profit > best_profit
            best_profit = curr_profit

        end
    end       
        
    
    
    return best_profit
    
    
end
