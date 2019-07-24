# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
    results = [0]
    1.upto(amount) do |target|
        cand = coins.map{|c| target-c}.select{|x| x>=0 && !results[x].nil?}.map{|x| results[x]}
        if cand.empty?
            results << nil
        else
            results << cand.min+1
        end
    end
    
    !results[amount].nil? ? (results[amount]):(-1)
end
