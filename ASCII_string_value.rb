# ASCII String Value
#
# Problem
# Write a method that takes a string argument and determines and 
# returns the sum of all ASCII values of characters in the string 
# (aka ASCII string value).
# 
# Use String#ord to determine ASCII values.
#
# Examples
# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0
#
# Data Structures
# array for processing characters
#
# Algorithm
# 1) split string into an array
# 2) initialize a variable (string_value) to hold the 
#    cumulative ASCII values
# 3) iterate over array with for-loop
# 4) add ASCII value of each character to 
# 5) return string_value
#
# Code
def ascii_value(str)
  char_array = str.split('')
  string_value = 0

  for char in char_array
    string_value += char.ord
  end

  return string_value
end

# Tests
puts "\nTests for ASCII String Value"
puts "------------------------------"
p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
