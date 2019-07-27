# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer}
def max_uncrossed_lines(a, b)
    dp = []
    
    b.size.times do 
        dp << Array.new(a.size)
    end

    b.size.times do |x|
        a.size.times do |y|
            cands = []
            cands << dp[x-1][y] if x>=1
            cands << dp[x][y-1] if y>=1
            
            cands << (dp[x-1][y-1] + (b[x]==a[y] ? 1:0)) if x>=1 && y>=1
            cands << 0+(b[x]==a[y] ? 1:0) if x<1 || y<1
            
            dp[x][y] = cands.max
            # p dp
        end
    end

    return dp.last.nil? ? 0:dp.last.last 
end
