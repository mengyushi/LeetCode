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
    return matrix[pre_idx].include? target
end
