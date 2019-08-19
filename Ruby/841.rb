# @param {Integer[][]} rooms
# @return {Boolean}
def can_visit_all_rooms(rooms)
    
    return false if rooms.empty?
    
    visited = Set[]
    to_visit = [0]
    
    while !to_visit.empty?
        pointer = to_visit.shift
        unless visited.include? pointer
            visited << pointer
            keys = rooms[pointer]
            keys.each do |key|
                to_visit << key if (!visited.include?(key) && !to_visit.include?(key))
            end
        end
    end
    
    return visited.size == rooms.size
    
end
