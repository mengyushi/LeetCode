# @param {Integer[]} a
# @return {Integer}
def longest_mountain(a)
    
    curr_start = nil
    curr_max = 0
    
    up = true
    
    (a.size-1).times do |i|
        print "======",a[i],"======\n"
        case 
            when curr_start.nil?
            then
                if a[i] < a[i+1] 
                    curr_start = i
                    p "Start a new mountain."
                else
                    p "Nothing. Not a mountain."
                end
            when curr_start
                case
                    when a[i] < a[i+1] && up
                    then
                        p "Nothing. Continue the mountain."
                    when a[i] == a[i+1] && up
                    then
                        # not a mountain
                        curr_start = nil
                        p "Stucked during up hill."
                    when a[i] > a[i+1] && up
                    then
                        up = false
                        p "Lets go down"
                    when a[i] < a[i+1] && !up
                        # mountain stop here
                        p "OK. Stop the mountain here."
                        curr_max = [curr_max,i-curr_start+1].max
                        p [curr_start,i]
                        curr_start = i
                        up = true
                    when a[i] == a[i+1] && !up
                        # mountain stop here
                        p "OK. Stop the mountain here (stucked)."
                        p [curr_start,i]
                        curr_max = [curr_max,i-curr_start+1].max
                        curr_start = nil
                        up = true
                    when a[i] > a[i+1] && !up
                        # do nothing
                        p "Nothing. Going down hill."
                    end
                
            end
    end 
    
    # for the last elements
    if curr_start && a[-1] < a[-2]
        curr_max = [curr_max, (a.size-1)-curr_start+1].max
    end              
    curr_max
end
