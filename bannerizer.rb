# Bannerizer
# 
# A method that takes a short line of text and 
# prints it in a box.
# 
# 
# Examples
#
# $ print_in_box('To boldly go where no one has gone before.')
# 
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
#
# 
# $ print_in_box('')
# 
# +--+
# |  |
# |  |
# |  |
# +--+
#
# 
# Data Types / Data Structures
#
# String -> Array -> String 
#
# 
# Algorithm
# 1) count number of characters in input string (String#length)
# 2) initialize an array
# 3) compose the lines (5 total) which will form the banner,
#    one per element of the array
# 4) join the array elements into a single string and return
#
# Code
require 'minitest/autorun'
require 'pry'

class TestBannerizer < Minitest::Test
  def test_bannerizer_with_message
    assert print_in_box('To boldly go where no one has gone before.') ==
"""+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+"""
  end

  def test_bannerizer_with_empty_string
    assert print_in_box('') == 

"""+--+
|  |
|  |
|  |
+--+"""

  end
end

def print_in_box(s)
  chars_in_message = s.length
  banner_array = []

  banner_array[0] = "+"
  (chars_in_message + 2).times { banner_array[0] << "-" }
  banner_array[0] << "+"

  banner_array[1] = "|"
  (chars_in_message + 2).times { banner_array[1] << " " }
  banner_array[1] << "|"

  banner_array[2] = "| " + s + " |"
  
  banner_array[3] = banner_array[1]

  banner_array[4] = banner_array[0]

  banner_array.join("\n")
end
