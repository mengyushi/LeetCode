# @param {Integer[]} barcodes
# @return {Integer[]}
def rearrange_barcodes(barcodes)
    order = []
    
    barcodes.sort!
    curr = barcodes.first
    pre = 0
    barcodes.size.times do |i|
        if barcodes[i] != curr
            order << [i-pre,curr]
            curr = barcodes[i]
            pre = i
        end     
    end
    
    order << [barcodes.size-pre,curr]
    
    p order
    
    order.sort!.reverse!
    
    result = Array.new(barcodes.size)  
    pos = 0
    order.each do |t,val|
        t.times do
            result[pos] = val
            pos = (pos>=barcodes.size-2) ? 1:pos+2
        end
    end
    result
end
