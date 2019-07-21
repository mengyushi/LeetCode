# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}

def find_words(board, words)
    res = []
    root = build_trie(words)
    
    board.length.times do |r|
        board.first.length.times do |c|
            dfs(board,r,c,root,res)
        end 
    end
    return res
end

def dfs(board,r,c,node,res)
    char = board[r][c]
    i = char.ord - 'a'.ord
    return if char == "#" || node.next[i].nil?
    node = node.next[i]
    if node.word
        res << node.word
        node.word = nil
    end
    board[r][c] = '#'
    dfs(board,r+1,c,node,res) if r+1 < board.length
    dfs(board,r-1,c,node,res) if r-1 >= 0
    dfs(board,r,c+1,node,res) if c+1 < board.first.length
    dfs(board,r,c-1,node,res) if c-1 >= 0
    board[r][c] = char
end

def build_trie(words)
    root = TrieNode.new
    words.each do |word|
        curr = root
        word.chars.each do |char|
            i = char.ord - 'a'.ord
            curr.next[i] ||= TrieNode.new
            curr = curr.next[i]
        end
        curr.word = word
    end
    return root
end

class TrieNode
    attr_accessor :next, :word
    def initialize
        @next = Array.new(26)
        @word = nil
    end
end
