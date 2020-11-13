# Daily Double
#
# A method that takes a string argument and returns
# a new string with all consecutive duplicate characters 
# condensed into a single character. All without using
# String#squeeze or String#squeeze!
#
# Examples
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''
#
# Data Type / Data Structures
# 
# String -> Array -> String
#
#
# Algorithm
# 1) split input string into words
# 2) split words into array of characters
# 3a) iterate over words
#   3b) iterate over characters
#       4) use select to filter out duplicate characters
# 5) join characters in words
# 6) join array of words into a single string
#
# Code

require "minitest/autorun"

class CheckDailyDouble < Minitest::Test
  def test_that_crunch_reduces_daily_double
    assert crunch('ddaaiillyy ddoouubbllee') == 'daily double'
    assert crunch('4444abcabccba') == '4abcabcba'
    assert crunch('ggggggggggggggg') == 'g'
    assert crunch('a') == 'a'
    assert crunch('') == ''
  end
end

def crunch(input_str)
  chars = input_str.split('')
  
  crunched = []
  last_char = nil
  chars.each do |char|
    next if char == last_char
    crunched << char
    last_char = char
  end
  
  crunched = crunched.join
end
