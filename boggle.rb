#!/usr/bin/env ruby
# Homework! 
# Only print out 1 of each word that it finds

# Hand this program a board and output words

class PrefixFinder
  def initialize(word_list)
    @my_hash = make_prefix_hash(word_list)
  end

  def search(prefix)
    return @my_hash[prefix]
  end

  private
  def make_prefix_hash( words )
    result = {}
    words.each do | word |
      result[word + "."] = word
      prefix = word
      while prefix.length > 0 do
        result[prefix] = word
        prefix = prefix.chop
      end
    end
    return result
  end
end

class BoggleSolver
  def initialize(dict)
    @prefix = PrefixFinder.new(dict)
  end
 
  def solve(board)
    word_list = []   
    word_dict = {}
    for row in 0..3
      for col in 0..3
        word_list=word_list+recurse(board,row, col, "")
      end
    end
    word_list.each { |word|
      word_dict[word] = word
    }
    return word_dict.keys # This should a list of matched words
  end 

  # This is going to be magic.. fucking magic - MB
  #private
  def recurse(board, row, col, word)
    # assume the board is 4x4
    if row < 0 or row >= 4 or col < 0 or col >= 4
      return []
    end
    word = word+board[row][col]
    word_list = []
    if @prefix.search(word+".") and @prefix.search(word+".").length > 2
      word_list.push(word)
    end
    if !@prefix.search(word)
      return []
    end 
    for diff_row in -1..1
       
       for diff_col in -1..1
         word_list = word_list+recurse(board,row+diff_row, col+diff_col, word)
       end
    end 
    return word_list
  end
end

# Testing Section yo!

test_board = [
  ["x","x","x","x"],
  ["c","a","t","x"],
  ["t","d","o","x"],
  ["x","x","g","x"]
]

test_dict = [ "cat", "dog", "fish" ]
test_solver = BoggleSolver.new(test_dict) 
#puts test_solver.solve(test_board)
#puts test_solver.recurse(test_board, 1, 2, "ca")
all_words = []
File.open('ospd.txt').each do | line |
  all_words.push(line.strip)
end

allword_solver = BoggleSolver.new(all_words)
puts allword_solver.solve(test_board)
