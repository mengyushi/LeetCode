# @param {Integer[]} difficulty
# @param {Integer[]} profit
# @param {Integer[]} worker
# @return {Integer}
def max_profit_assignment(difficulty, profit, worker)
    return 0 if difficulty.empty? || profit.empty? || worker.empty?
    profits = process(difficulty, profit)
    # p profits
    result = 0
    min = profits.keys.min
    max = profits.keys.max
    worker.each do |x|
        if x >= min
            if x<=max
                result += profits[x]
            else
                result += profits[max]
            end
        end
    end
    result
end

def process(difficulty, profit)
    result = {}
    all = []
    difficulty.size.times {|i| all<<[difficulty[i],profit[i]]}
    all.sort!
    
    0.upto(all.size-2) do |i|
        all[i][-1] = all[i-1][-1] if i>0 && all[i-1].last > all[i].last
        (all[i].first).upto(all[i+1].first-1) do |k|
            result[k] = all[i].last
        end
    end
    
    all[-1][-1] = all[-2][-1] if all.size >= 2 && all[-2][-1] > all[-1][-1]
    result[all[-1][0]] = all[-1][-1]
    result
end
