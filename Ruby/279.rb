# @param {Integer} n
# @return {Integer}
def num_squares(n)
    return 0 if n == 0
    
    results = [0]
    
    1.upto(n) do |x|
        cands = []
        1.upto(Math.sqrt(x).floor) do |i|
            cands << results[x-i*i]+1
        end
        results << cands.min
    end

    results.last
end
