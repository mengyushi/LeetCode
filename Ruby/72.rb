# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
    dp = []
    (word2.size+1).times do
        dp << Array.new(word1.size+1)
    end
    
    0.upto(word2.size) do |x|
        0.upto(word1.size) do |y|
            if x == 0 && y == 0
                dp[x][y] = 0
            else
                if x>0 && y>0 && word2[x-1]==word1[y-1]
                    curr = 0
                else
                    curr = 1
                end
                cands = []
                cands << 1+dp[x-1][y] if x > 0
                cands << 1+dp[x][y-1] if y > 0
                cands << curr+dp[x-1][y-1] if x > 0 && y > 0
                dp[x][y] = cands.min
            end
        end
    end
    # dp.each {|x| p x}
    dp.last.last
end
