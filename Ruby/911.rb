class TopVotedCandidate
    attr_accessor :a
=begin
    :type persons: Integer[]
    :type times: Integer[]
=end
    def initialize(persons, times)
        
        @a = []
        leader = nil
        max_vote = 0
        
        count = {}
        
        persons.size.times do |i|
            count[persons[i]].nil? ? count[persons[i]] = 1 : count[persons[i]]+=1
            curr = count[persons[i]]
            if curr >= max_vote
                if persons[i]!=leader
                    leader = persons[i]
                    @a << [times[i],leader]
                end
                max_vote = curr
            end
        end
        @a.sort!
    end


=begin
    :type t: Integer
    :rtype: Integer
=end
    def q(t)
        
        return @a.last.last if t >= @a.last.first
        return nil if t < @a.first.first
        
        l = 0
        r = @a.size-1
        
        while l<(r-1)
            m = (l+r)/2
            if @a[m].first < t
                l = m
            elsif @a[m].first==t
                return @a[m].last
            else
                r = m
            end
        end
        return @a[l].last
    end


end

# Your TopVotedCandidate object will be instantiated and called as such:
# obj = TopVotedCandidate.new(persons, times)
# param_1 = obj.q(t)
