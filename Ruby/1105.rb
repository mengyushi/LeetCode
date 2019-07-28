# @param {Integer[][]} books
# @param {Integer} shelf_width
# @return {Integer}
def min_height_shelves(books, shelf_width)
    dp = [0]
    books.size.times { dp << nil }
    
    1.upto(books.size) do |i|
        max_width = shelf_width
        max_height = 0
        j = i-1
        while j>=0 && max_width - books[j][0]>=0
            max_width -= books[j][0]
            max_height = [max_height,books[j][1]].max
            if dp[i].nil?
                dp[i] = dp[j]+max_height
            else
                dp[i] = [dp[i],dp[j]+max_height].min 
            end
            j-=1
        end
    end
    
    #p dp
    
    return dp.last
end
