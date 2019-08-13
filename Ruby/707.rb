class MyLinkedList

=begin
    Initialize your data structure here.
=end
    attr_accessor :head
    
    def initialize()
        @head = nil
    end


=begin
    Get the value of the index-th node in the linked list. If the index is invalid, return -1.
    :type index: Integer
    :rtype: Integer
=end
    def get(index)
        return -1 if index < 0
        i = 0
        head = @head
        
        while !head.nil? && i<index
            return -1 if head.nil?
            head = head.next
            i+=1
        end
        
        case head
            when nil then 
                return -1
            else return head.val
            end
        
    end


=begin
    Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
    :type val: Integer
    :rtype: Void
=end
    def add_at_head(val)
        new_head = ListNode.new(val)
        new_head.next = @head
        @head = new_head
    end


=begin
    Append a node of value val to the last element of the linked list.
    :type val: Integer
    :rtype: Void
=end
    def add_at_tail(val)
        new_tail = ListNode.new(val)
        head = @head
        case @head
            when nil then @head = new_tail
            else
                while !head.next.nil?
                    head = head.next
                end
                head.next = new_tail   
            end
    end

=begin
    Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted.
    :type index: Integer
    :type val: Integer
    :rtype: Void
=end
    def add_at_index(index, val)
        
        return self.add_at_head(val) if index < 0
        
        node = ListNode.new(val)
        
        case index
            when 0 
            then
                node.next = @head
                @head = node
            else 
                i = 0
                head = @head 
                while i<index-1
                    return if head.nil?
                    head = head.next
                    i+=1
                end
                return if head.nil?
                node.next = head.next
                head.next = node
                
            end
    end


=begin
    Delete the index-th node in the linked list, if the index is valid.
    :type index: Integer
    :rtype: Void
=end
    def delete_at_index(index)
        return if @head.nil? || index < 0
        case index
            when 0 then @head = @head.next
            else
                i = 0
                head = @head
                while i < index-1
                    return if head.nil?
                    head = head.next
                    i+=1
                end
                return if head.next.nil?
                head.next = head.next.next
            end
 
    end


end

class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end
