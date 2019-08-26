# @param {Integer} n
# @param {Integer[]} primes
# @return {Integer}
def nth_super_ugly_number(n, primes)
    results = [1]
    
    i_arr = []
    
    (0..primes.size-1).step(1) do 
        i_arr << 0
    end
    
    while results.size < n
        
        v_arr = []
        
        (0..primes.size-1).step(1) do |i|
            v_arr << results[i_arr[i]] * primes[i]
        end
        
        min = v_arr.min
        
        results << min
        
        (0..primes.size-1).step(1) do |i|
            i_arr[i]+=1 if results[i_arr[i]] * primes[i] == min
        end        
        
        
    end
    
    results.last
end
