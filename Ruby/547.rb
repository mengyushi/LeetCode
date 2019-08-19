# @param {Integer[][]} m
# @return {Integer}
def find_circle_num(m)
    groups = []
    
    while !m.empty?
        pointer = m.shift
        
        friends = []
        
        pointer.each_with_index do |x,friend|
            friends << friend if x == 1
        end
        
        if groups.empty?
            groups << friends
        else
            related_groups = find_related_groups(friends,groups).to_a.sort.reverse
            if related_groups.empty?
                groups << friends.to_set
            else
                new_friends = friends.to_set
                related_groups.each do |i|
                    groups[i].each do |friend|
                        new_friends << friend
                    end
                    groups.delete_at(i)
                end
                groups << new_friends
            end
        end
    end
    # p groups
    return groups.size
end

def find_related_groups(friends,groups)
    result = Set[]
    friends.each do |friend|
        groups.each_with_index do |group,i|
            result << i if group.include?(friend)
        end
    end
    return result
end
