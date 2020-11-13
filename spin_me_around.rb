# Spin Me Around In Circles
#
# Problem
# Given the method below, will the returned string be the same
# object as the input string, or a different object?
# 
# Prediction
# Although the String#reverse! method does mutate the caller,
# in the case of a string passed in to spin_me() the string being
# returned is a new string composed by the Array#join method. 
#
# Algorithm
# 1) determine the object id of a string
# 2) pass that string into spin_me()
# 3) determine the object id of the resulting string
# 4) compare 1 and 3
#
#

require "minitest/autorun"

class TestSpin < Minitest::Test
  def test_object_ids_before_and_after
    test_string = "hello world"
    assert spin_me(test_string).object_id != test_string.object_id
  end
end

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"
