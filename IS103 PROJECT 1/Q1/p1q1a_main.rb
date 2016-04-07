# p1q1a_main.rb
# Do not submit this file
# You may modify this file for testing purposes, 

load "p1q1a.rb"
load "p1q1_utility.rb"
include Math

# constants
ENERGY_UP   = 1  # units of energy required to walk up 1 floor
ENERGY_DOWN = 1  # units of energy required to walk down 1 floor

# get name of CSV file from keyboard
puts
print "CSV file in data folder to read from (e.g. case1.csv) :"
file_name = gets.chomp

# ----- prepare data ------

# read from file_name and store in input
# the following statements read the target floors from the CSV file into 
# target_floors. You don't have to know these statements work.
target_floors = []
read_file("data/"+file_name).each{ |line|
  array = line.split(",").map(&:strip)
  convert_array_elements_to_i(array)
  
  target_floors << array.shift # each line is the target floor
}

# make a clone of target_floors. original_target_floors will be used for calculating the score later
# this is important just in case the get_floor method modifies target_floors passed in.
original_target_floors = Marshal.load(Marshal.dump(target_floors))

# uncomment the following statement if desired
# puts "Read the following data from " + file_name + ":" + target_floors.inspect
puts 

# get number of floors from user
print "Enter number of floors in this building :"
number_of_floors = gets.to_i

# run the test case
puts "Invoking your find_floor method now using input read from " + file_name
start_time = Time.now
selected_floor = get_floor(number_of_floors, target_floors)
puts "Execution time #{Time.now - start_time} seconds." # display time lapsed
puts 

# ----- correctness testing code ------ 

# check for errors in selected_floor
if (selected_floor == nil)
  # error
  puts "Error : your method returned nil. It should return an integer."
elsif (!selected_floor.kind_of?(Integer))
  # error
  puts "Error : your method returned something other than an integer. It should return an integer."
else 
  # no errors - check and print out quality of answer
  energy_required = get_energy_required(selected_floor, original_target_floors, ENERGY_UP, ENERGY_DOWN)
  puts "Your lift is stopping at level :" + selected_floor.to_s
  puts "Energy required to move up   1 floor :" + ENERGY_UP.to_s
  puts "Energy required to move down 1 floor :" + ENERGY_DOWN.to_s
  puts
  puts "Total energy units required by all users (e):" + energy_required.to_s
  puts "Your algorithm should strive for a low e."
end