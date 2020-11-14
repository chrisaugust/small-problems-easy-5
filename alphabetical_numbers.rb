# Alphabetical Numbers
#
# A method that takes an array of integers between 0 and 19, 
# returning an array of those integers sorted based on the 
# alphabetical order of the English words for each number.
#
# Example
# alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ] 
# 
# Data Types / Data Structures
# input array[int] -> conversion hash -> array[string, int] -> return array[int]
#
# Algorithm
# 1) sort the English words for 0 - 19 alphabetically
# 2) use those sorted words to generate a conversion hash with
#    English words for numbers and their corresponding numerical 
#    representation
# 3) step through input array, for each number creating 2 item arrays 
# with the English word for the number along with the number itself
# 4) sort the array of arrays using the English words
# 5) return an array of just the numbers from the sorted arrays
# 
# Code  
require 'test/unit'
require 'pp'

class AlphaNumSort < Test::Unit::TestCase
  
  def test_alphabetic_number_sort
    alphabetically_sorted = [8, 18, 11, 15, 5, 4, 14, 9, 
    19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
    
    assert_equal(alphabetic_number_sort((0..19).to_a), 
                 alphabetically_sorted)

    assert_equal(alphabetic_number_sort((0..19).to_a.reverse),
                 alphabetically_sorted)                      

    assert_equal(alphabetic_number_sort([0, 12, 5, 18]),
                 [18, 5, 12, 0])
  end

end


def alphabetic_number_sort(input_array)

  # make conversion hash
  words_for_numbers = %w( zero one two three four five
                          six seven eight nine ten 
                          eleven twelve thirteen fourteen
                          fifteen sixteen seventeen eighteen
                          nineteen )
  numbers = (0..19).to_a
  conversion_hash = Hash[numbers.zip(words_for_numbers)]

  # pp conversion_hash

  # step through input_array, converting each number to an array with English word
  words_and_numbers = input_array.map do |num| 
    [conversion_hash[num], num]
  end
  # pp words_and_numbers
  
  # sort by English words
  sorted = words_and_numbers.sort_by { |arr| arr[0] }
  
  # create a return array with just the numbers
  just_nums = []
  sorted.each { |arr| just_nums << arr[1] }
  # puts "Just the numbers: #{just_nums}"
  
  just_nums 
  
end
