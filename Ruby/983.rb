# @param {Integer[]} days
# @param {Integer[]} costs
# @return {Integer}
def mincost_tickets(days, costs)
    return 0 if days.empty?
    first = days.min
    last = days.max
    results = [0]
    1.upto(last-first+1) do |day|
        if days.include?(day+first-1)
            cands = []
            cands << (day-1>=0 ? (results[day-1]+costs[0]):costs[0])
            cands << (day-7>=0 ? (results[day-7]+costs[1]):costs[1])
            cands << (day-30>=0 ? (results[day-30]+costs[2]):costs[2])
            results << cands.min
        else
            results << results.last
        end
    end
    results.last
end 
