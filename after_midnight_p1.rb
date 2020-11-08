# After Midnight Part 1
#
# Problem
# Time of day can be represented as the number of minutes before 
# or after midnight. Negative numbers for before midnight, positive
# numbers for after.
#
# Write a method that takes a time in this minute based format and
# returns the time of day in an hour based format (hh:mm). This 
# method should work with any integer input.
#
# Don't use Date and Time classes. Ignore complications such
# as Daylight Savings and Standard Time, etc.
#
# Examples
# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"
#
# Data Structures
#
# Algorithm
# for positive integers:
# 1) convert minutes into hours (divide by 60)
# 2) in the case that the hours are greater than
#    24 hours, determine remainder of hours % 24 
# 3) determine remainder of step 1 (modulo 60)
#    to be used as the minutes component of time format
# 4) convert to correct hours:minutes format
# 5) return formatted string
#
# for negative integers:
# 1) same as above
# 2) same as above
# 3) % 60 for minutes, but this amount must now be
#    subtracted from 60 to give correct result 
# 4) convert to correct format
# 5) return formatted string
#
# Code

def time_of_day(int)
  h = (int/60) % 24
  m = int % 60  

  h_str = convert_to_format(h)
  m_str = convert_to_format(m)
  h_and_m = "#{h_str}:#{m_str}" 
  p h_and_m
  return h_and_m
end

def num_digits(int)
  num_digits = 1
  loop do 
    quotient = int / 10**num_digits
    break if quotient == 0
    num_digits += 1
  end
  return num_digits  
end

def convert_to_format(int)
  if num_digits(int) < 2
    int_str = '0' + int.to_s
  else
    int_str = int.to_s
  end

  return int_str
end

# Tests
puts "\nTests for After Midnight Part 1"
puts "---------------------------------"
p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
