# @param {String} j
# @param {String} s
# @return {Integer}
def num_jewels_in_stones(j, s)
    return s.split('').count {|x| j.include?(x)}
end