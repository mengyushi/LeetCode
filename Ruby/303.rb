class NumArray

=begin
    :type nums: Integer[]
=end
    
    def initialize(nums)
        @nums = nums
    end


=begin
    :type i: Integer
    :type j: Integer
    :rtype: Integer
=end
    def sum_range(i, j)
        return @nums[i..j].sum
    end


end