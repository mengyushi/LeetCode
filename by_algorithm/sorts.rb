# @param {Integer[]} nums
# @return {Integer[]}

def sort_array(nums)
    # merge_sort(nums)
    # bubble_sort(nums)
    # selection_sort(nums)
    # insertion_sort(nums)
    # heap_sort(nums)
    # quick_sort(nums)
end

###### Quick Sort ######

# Time Complexity: O(NlogN) (average)
# Sapce Complexity: O(1)

# pick the last as partition
# when left marker reached number greater or equal to pivot, stop
# when right marker reached number smaller than pivot, stop
# when both left and right stopped, swap
# when l == r, swap it with partition 

def quick_sort(nums)
    
    return nums if nums.size <= 1
    
    return [nums.min, nums.max] if nums.size == 2
    
    partition = nums[-1]
    
    l, r = 0, nums.size-2
    
    until l >= r
        p [l,r]
        while l <= nums.size-2 and nums[l] < partition
            l+=1
        end
        
        while r > 0 and r >= l and nums[r] >= partition
            r-=1
        end
        
        if l!=r and l < r
            nums[l],nums[r] = nums[r],nums[l]
        end
    end
    
    nums[-1],nums[l] = nums[l],nums[-1]
    
    return [nums[0]] + quick_sort(nums[1..-1]) if l == 0
    
    return quick_sort(nums[0..l-1]) + [nums[l]] + quick_sort(nums[l+1..-1]) if l < nums.size-1
    
    return quick_sort(nums[0..l-1]) + [nums[l]]
    
end

###### Heap Sort ######

# Time Complexity: O(NlogN)
# Space Complexity: O(N)

# Heap: a child number is always grater than its parent number.

# Add:
# New number added to the first empty place. If smaller than parent, swap.

# Extracting:
# Remove Top (smallest). The number at the end of the line moves to the top.
# Swap with child which smaller than it self (if both, swap with the SMALLEST).

class HeapNode
    attr_accessor :val, :parent,:left_child, :right_child
    def initialize(val)
        @val = val
        @parent = nil
        @left_child = nil
        @right_child = nil
    end
end

class Heap
    
    attr_accessor :root
    
    def initialize
        @root = nil    
    end
    
    def show
        # BFS print
        return [] unless @root
        result = []
        to_check = [@root]
        until to_check.empty?
            pointer = to_check.shift
            result << pointer.val
            to_check << pointer.left_child if pointer.left_child
            to_check << pointer.right_child if pointer.right_child
        end
        return result
    end
    
    def add(val)
        
        node = HeapNode.new(val)
        
        if @root.nil?
            @root = node
            return
        end
        
        # BFS find the first empty spot
        
        to_check = [@root]
        
        while true
            pointer = to_check.shift
            
            if pointer.left_child
                to_check << pointer.left_child
            else
                pointer.left_child = node
                node.parent = pointer
                break
            end
            
            if pointer.right_child
                to_check << pointer.right_child
            else
                pointer.right_child = node
                node.parent = pointer
                break
            end            
        end
        
        # move up to right place
        
        pointer = node
        while pointer.parent and pointer.val < pointer.parent.val
            pointer.val, pointer.parent.val = pointer.parent.val, pointer.val 
            pointer = pointer.parent
        end
        
    end
    
    def extract
        result = @root.val
        
        # BFS find last node
        to_check = [@root]
        until to_check.empty?
            pointer = to_check.shift
            to_check << pointer.left_child if pointer.left_child
            to_check << pointer.right_child if pointer.right_child
        end
        
        @root.val = pointer.val
        
        # Remove the last node in heap
        
        if pointer.parent.nil?
            @root = nil
            return result
        elsif pointer.parent.right_child.nil?
            pointer.parent.left_child = nil
        else
            pointer.parent.right_child = nil
        end
        
        # Shift down the @root to right place
        
        pointer = @root
        
        until pointer.left_child.nil?
            
            case
            when pointer.right_child.nil?
            then
                if pointer.val <= pointer.left_child.val
                    return result
                else
                    pointer.val, pointer.left_child.val = pointer.left_child.val, pointer.val
                    pointer = pointer.left_child
                end

            else
                if pointer.val <= [pointer.left_child.val, pointer.right_child.val].min
                    return result
                else

                    if pointer.val > [pointer.left_child.val, pointer.right_child.val].max
                        if pointer.left_child.val <= pointer.right_child.val
                            pointer.val, pointer.left_child.val = pointer.left_child.val, pointer.val
                            pointer = pointer.left_child
                        else
                            pointer.val, pointer.right_child.val = pointer.right_child.val, pointer.val
                            pointer = pointer.right_child
                        end
                    else
                        if pointer.val > pointer.left_child.val
                            pointer.val, pointer.left_child.val = pointer.left_child.val, pointer.val
                            pointer = pointer.left_child
                        else
                            pointer.val, pointer.right_child.val = pointer.right_child.val, pointer.val
                            pointer = pointer.right_child    
                        end 
                    end
                end
                
            end
        end  
            
        return result    
    end
    
end
    
def heap_sort(nums)
    heap = Heap.new
    nums.each do |n|
        heap.add(n)
    end
    
    result = []
    
    until heap.root.nil?
        result << heap.extract
    end
    
    return result
end
    
###### Insertion Sort #####

# Time Complexity: O(N^2)
# Space Complexity: O(1)

def insertion_sort(nums)
    1.upto(nums.size-1) do |i|
        while i>0 and nums[i] < nums[i-1]
            nums[i-1], nums[i] = nums[i],nums[i-1]
            i-=1
        end
    end
    nums
end

###### Quick Sort ######

###### Selection Sort #####

# Time Complexity: O(N^2)
# Time Complexity: O(N) (Could be O(1) with improvement)

def selection_sort(nums)
    result = []
    nums.size.times do
        curr = nums.min
        result << curr
        nums.delete_at(nums.index(curr))
    end
    result
end


###### Bubble Sort ######

# Time Complexity: O(N^2)
# Space Complexoty: O(1)

def bubble_sort(nums)
    return nums if nums.size <= 1
    (nums.size-2).downto(0) do |i|
        0.upto(i) do |k|
           nums[k+1], nums[k] = nums[k], nums[k+1] if nums[k] > nums[k+1] 
        end
    end
    nums
end

###### Merge Sort ######

# Time Complexity: NlongN
# Space Complexity: N

def merge_sort(nums)
    return [] if nums.empty?
    if nums.size > 1
        return merge(sort_array(nums[0..(nums.size-1)/2]),sort_array(nums[(nums.size-1)/2+1..-1]))
    else
        return nums
    end
end

def merge(nums1,nums2)
    
    result = []    
    until nums1.empty? or nums2.empty?
        if nums1.first < nums2.first
            result << nums1.shift
        else
            result << nums2.shift
        end
    end
    
    result += nums1 unless nums1.empty?
    result += nums2 unless nums2.empty?
    
    return result
    
end


