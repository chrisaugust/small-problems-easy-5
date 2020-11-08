# After Midnight Part 2
#
# Problem
# Write two methods that take a time of day in 24 hour format,
# and return the number of minutes before and after midnight respectively.
#
# Don't use ruby's Date and Time methods.
#
# Disregard complexities such as Daylight Savings and Standard Time.
#
# Examples
# after_midnight('00:00') == 0
# before_midnight('00:00') == 0
# after_midnight('12:34') == 754
# before_midnight('12:34') == 686
# after_midnight('24:00') == 0
# before_midnight('24:00') == 0
# 
# Data Types and/or Data Structures 
# string -> array -> integer
#
# Algorithm
# after_midnight()
# 1) split input string on ':' into an array, time_arr
# 2) iterate over time_arr and convert strings to integers
# 2) process time_arr[0] as hours (multiply by 60) 
# and time_arr[2] as minutes
# 3) sum integer values of the array with Array#reduce 
# 4) return the sum
#
# before_midnight()
# 1 - 3) same as above
# 4) calculate and return sum % (24 * 60)
#
# Code
require_relative "../small-problems-easy-4/string_to_number"

def after_midnight(time_str)
  # split time_str on ':' into time_arr
  time_arr = time_str.split(':')
  # convert time_arr values from strings to integers with Array#each
  time_arr.each_with_index { |val, idx| time_arr[idx] = string_to_integer(val) }
  # convert hours (time_arr[0]) to minutes
  time_arr[0] = time_arr[0] * 60
  # sum and return
  sum = time_arr.reduce(:+)
  p "Sum of after_midnight(#{time_str}) is #{sum}."
  if sum == 1440
    return 0
  else
    return sum
  end
end

def before_midnight(time_str)
  # call after_midnight to convert time string to minutes
  minutes = after_midnight(time_str)
  # calculate and return minutes % (24 * 60)
  result = -minutes % (24 * 60)
  p "Result of before_midnight(#{time_str}) is #{result}"
  return result
end

# Tests
puts "\nTests"
puts "------"
p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
