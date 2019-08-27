# @param {Integer} k
# @param {Integer} n
# @return {Integer}
def super_egg_drop(k, n)
    @k = k
    @n = n
    lo, hi = 1, n
    while lo<hi
        mi = (lo+hi)/2
        if f(mi) < n
            lo=mi+1
        else
            hi = mi
        end
    end
    return lo
end

def f(x)
    ans = 0
    r = 1
    1.upto(@k) do |i|
        r*=x-i+1
        r/=i
        ans+=r
        break if ans>=@n
    end
    return ans
end
