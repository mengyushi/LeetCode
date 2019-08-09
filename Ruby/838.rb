# @param {String} dominoes
# @return {String}
def push_dominoes(dominoes)
    if dominoes.nil? || dominoes.empty?
        return ''
    elsif dominoes[0] == '.'
        
        i = 0
        while (i < dominoes.size && dominoes[i] == '.')
            i+=1
        end
        
        return dominoes if i == dominoes.size
        
        case dominoes[i]
            when 'L'
            then 
                return ('L'*(i+1))+push_dominoes(dominoes[i+1..-1])
            when 'R'
                return ('.'*i)+push_dominoes(dominoes[i..-1])
            end
        
    elsif dominoes[0] == 'L'
        return 'L' + push_dominoes(dominoes[1..-1])
            
    elsif dominoes[0] == 'R'
        if dominoes.size == 1
            return 'R'
        elsif dominoes[1] == 'R'
            return 'R'+ push_dominoes(dominoes[1..-1])
        elsif dominoes[1] == 'L'
            return 'RL' + push_dominoes(dominoes[2..-1])
            
        elsif dominoes[1] == '.'
            i = 1
            while (i<dominoes.size && dominoes[i] == '.')
                i+=1
            end
            
            if i == dominoes.size
                return 'R'*dominoes.size
            else
                case dominoes[i]
                    when 'R'
                    then
                        return ('R'*i) + push_dominoes(dominoes[i..-1])
                    when 'L'
                    then
                        return 'R'*((i+1)/2)+'.'*((i+1)%2)+ 'L'*((i+1)/2) + push_dominoes(dominoes[i+1..-1])
                    end
            end
            
        end
            
    end
end
