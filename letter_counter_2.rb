# Letter Counter (Part 2)
#
# A method that takes a string with one or more space
# separated words, strips out non-alphanumerics, and 
# returns a hash showing the number of words of different sizes
#
# Examples
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# word_sizes('') == {}
#
# Data Types / Data Structures
# string -> array -> hash
#  
# Algorithm
# 1) split input string into array of words with String#split
# 2) remove punctuation from words
# 3) create an empty hash
# 4) populate hash by iterating over array of words, keys: word lengths and vals: num occurrences
# 5) return hash
#
# Code
require 'minitest/autorun'
require 'pry'

class LetterCounter < Minitest::Test
  def test_word_sizes_method
    assert word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }               
    assert word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
    assert word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
    assert word_sizes('') == {}                                                                  
  end
end

def word_sizes(str)
  word_arr = str.split

  word_arr.each { |word| word.gsub!(/[^A-Za-z]/, '') }
  binding.pry
  
  word_hash = {}
  word_arr.each do |word|
    word_hash.key?(word.length) ? word_hash[word.length] += 1 : word_hash[word.length] = 1
  end

  return word_hash
end
