# Letter Swap
#
# Problem
# Write a method that takes a string of word separated by spaces,
# and returns a string in which the first and last characters of 
# each word are swapped.
#
# Assume that every word contains at least one letter, 
# that every string will contain at least one word,
# and that each string contains nothing but words and spaces.
#
# Examples
# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'
#
# Data Types / Data Structures
# string -> array -> string
#
# Algorithm
# 1) split input string into array of words
# 2) for each word in the array, swap 1st and last letters
# 3) rejoin the words into a single string
#
# Code

require 'minitest/autorun'

def swap(input_str)
  input_arr = input_str.split
  for word in input_arr
    word[0], word[-1] = word[-1], word[0]
  end  
  
  output_str = input_arr.join(' ')
  p output_str
end

class LetterSwapTest < Minitest::Test
  def test_method_swaps_first_and_last_letters
    assert swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
    assert swap('Abcde') == 'ebcdA'
    assert swap('a') == 'a'
  end
end

