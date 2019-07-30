# @param {Integer[]} people
# @param {Integer} limit
# @return {Integer}
def num_rescue_boats(people, limit)
    people.sort!
    p1 = 0
    p2 = people.size-1
    
    result = 0
    
    while p1 <= p2
        if people[p1] + people[p2] > limit
            p2-=1
        else
            p1+=1
            p2-=1
        end
        result+=1
    end
    result
end
