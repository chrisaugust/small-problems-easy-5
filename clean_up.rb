# Clean up the words
#
# Problem
# Given a lower case string with an assortment of non-alphanumeric
# characters, write a method that returns the string stripped of 
# all non-alphanumerics. The result shouldn't have more than one
# space between words (no consecutive spaces).
#
# Example
# cleanup("---what's my +*& line?") == ' what s my line '
#
# Data Types / Data Structures
# string -> array -> string
#
# Algorithm
# 1) split string into array of characters
# 2) iterate through characters, removing non-alphanumerics
# 3) delete excess white space
#    - if statement that delets or retains current value
#      based on whether previous array value is whitespace
# 4) join array values back into a string
#
# Code
require 'minitest/autorun'

class CleanupTest < Minitest::Test
  def test_cleanup_method
    assert cleanup("---what's my +*& line?") == ' what s my line '
  end
end

def cleanup(input_str)
  input_arr = input_str.split('')
  
  stripped_arr = input_arr.map do |char| 
    if char.match(/[^a-z]/)
      char = ' '
    else
      char
    end
  end

  no_extra_spaces_arr = []
  last_char = nil
  stripped_arr.each do |char|
    if char.match(/[a-z]/)
      no_extra_spaces_arr << char
    elsif char.match(/\s/) && last_char != ' '
      no_extra_spaces_arr << char
    end
    last_char = char
  end

  return no_extra_spaces_arr.join()
end
