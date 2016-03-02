# lab2a_main.rb
# Do not submit this file

# You may modify this file for testing purposes, 
# but your final lab2a.rb must be able to run with the original lab2a_main.rb.

load "lab2a.rb"
load "lab2_utility.rb"
include Math

# constants
NO_OF_REPETITIONS = 100
DATA_FILE_NAME = "employees_1mil.csv" # change the data file name if you want to use another data file

# ----- prepare data ------

$employee_list = []
# the following statements read all the IDs from the data CSV file into 
# $employee_list. You don't have to know these statements  work.
puts "Reading data from " + DATA_FILE_NAME + " now ..."
read_file("data/"+DATA_FILE_NAME).each{ |line| 
  array = line.split(",").map(&:strip)
  convert_array_elements_to_i(array)
  $employee_list << array[0].to_i
}
# make a clone of $employee_list. This clone (EMPLOYEE_LIST_CLONE) will be used for correctness testing later
EMPLOYEE_LIST_CLONE = Marshal.load(Marshal.dump($employee_list)) 

# ----- performance testing code ------

# generate random numbers
puts "Generating random numbers now..."
random_numbers = []
for i in 0...NO_OF_REPETITIONS
  random_numbers << rand(2001000) # generate a random employee ID between 0 and 2001000
end

# run the test cases
puts "Starting timer..."
puts "Calling your perform_once method now..."
startTime = Time.now
perform_once

results = [] # will contain all your results
puts "Calling your exist? method " + NO_OF_REPETITIONS.to_s + " times now..."
for i in 0...NO_OF_REPETITIONS
  result = exist?(random_numbers[i]) # the correctness is not checked
  results << result  # insert your result into the results array for correctness checking later
end

time_taken = Time.now - startTime
puts "Stopping timer..."
puts "Execution time " + time_taken.to_s + " seconds." # display time lapsed

# ----- correctness testing code ------ 
# ONLY FOR data file: employees_1mil.csv
puts "Checking the first 100 results now..."
all_correct = true
for i in 0...[100, NO_OF_REPETITIONS].min
  if results[i] != EMPLOYEE_LIST_CLONE.include?(random_numbers[i])
    puts "ERROR in your result when searching for employee ID " + random_numbers[i].to_s
    all_correct = false
  end
end

if all_correct
  puts "Results are correct! - you may upload lab2b.rb to the submission server"
else
  puts "Your exist? method is not correctly written :-("
end
