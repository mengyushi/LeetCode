# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
    return false if matrix.empty? || matrix.first.empty?
   
    starts = matrix.map{|row| row.first}
    
    pre = nil
    pre_idx = nil
    
    starts.each_with_index do |start,i|
        case pre
            when nil 
            then
                if start < target
                    pre = start
                    pre_idx = i
                elsif start == target
                    return true
                else
                    return false
                end
            else
                if start < target
                    pre = start
                    pre_idx = i
                elsif start == target
                    return true
                else
                    break
                end
            end    
    end
        
    # in row 0..pre_idx 
    col_idx = nil
        
    matrix.first.each_with_index do |x,i|
        if x == target
            return true
        elsif col_idx.nil? || x < target
            col_idx = i
        elsif x > target
            break
        end
    end

    (0..pre_idx).step(1) do |row|
        return true if matrix[row].slice(0..col_idx).include? target
    end
    return false
end
