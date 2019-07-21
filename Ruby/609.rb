=begin
# Employee info
class Employee
    attr_accessor :id, :importance, :subordinates
    def initialize( id, importance, subordinates)
        # It's the unique id of each node.
        # unique id of this employee
        @id = id
        # the importance value of this employee
        @importance = importance
        # the id of direct subordinates
        @subordinates = subordinates
    end
end
=end
# @param {Employee} employees
# @param {Integer} id
# @return {Integer}
def get_importance(employees, id)
    return 0 if employees.empty?
    pointer = nil
    employees.each do |e|
        pointer = e if e.id == id
    end
    
    return nil unless pointer
    
    result = pointer.importance
    
    to_check = [pointer]
    
    until to_check.empty?
        pointer = to_check.shift
        pointer.subordinates.each do |sub|
            result += employees.select{|e| e.id == sub}.first.importance
            to_check << employees.select{|e| e.id == sub}.first
        end
    end
    
    return result
end
