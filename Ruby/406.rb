# @param {Integer[][]} people
# @return {Integer[][]}
def reconstruct_queue(people)
    people.sort!.reverse!
    p people
    
    result = []
    
    until people.empty?
        curr = []
        curr_h = people.first.first
        
        while !people.empty? && people.first.first == curr_h
            curr = [people.shift]+curr
        end
        # p "======"
        # p curr
        
        until curr.empty?
            pointer = curr.shift
            if pointer.last == 0
                result = [pointer]+result
            else
                result = result[0..pointer.last-1]+[pointer]+result[pointer.last..-1]
            end
        end
    end
    
    result
    
end
