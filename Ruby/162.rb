# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
    return nums.find_index(nums.max)
end
