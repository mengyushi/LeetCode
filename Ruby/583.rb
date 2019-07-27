# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
    
    return word1.size if word2.size == 0
    return word2.size if word1.size == 0
    
    dp  = []
    (word2.size).times do
        dp << Array.new(word1.size)
    end
    
    word2.size.times do |x|
        word1.size.times do |y|
            cands = []
            cands << (word2[x] == word1[y] ? 1:0)  if x==0 || y==0
            cands << dp[x-1][y] if x-1>=0
            cands << dp[x][y-1] if y-1>=0
            cands << dp[x-1][y-1]+(word2[x] == word1[y] ? 1:0) if x-1>=0 && y-1>=0
            dp[x][y] = cands.max
        end
    end
    p dp
    word1.size+word2.size-dp.last.last*2
end
