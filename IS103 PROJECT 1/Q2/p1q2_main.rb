# p1q2_main.rb
# Do not submit this file
# You may modify this file for testing purposes.

load "p1q2.rb"
load "p1q2_utility.rb"
include Math

# get name of CSV file from keyboard
puts
print "CSV file in data folder that contains menu (e.g. menu_eg1.csv) :"
menu_file_name = gets.chomp
print "CSV file in data folder that contains diet plans (e.g. diet_eg1.csv) :"
diet_file_name = gets.chomp

# ----- prepare data ------

# read from files and store in variables
# You don't have to know these statements work.
lines = read_file("data/" + menu_file_name)  # there should only be 3 lines
carbs = lines[0].split(",").map(&:strip)  # 1st line is carbs
convert_array_elements_to_i(carbs)
protein = lines[1].split(",").map(&:strip)  # 2nd line is protein
convert_array_elements_to_i(protein)
fat = lines[2].split(",").map(&:strip)  # 3rd line is fat
convert_array_elements_to_i(fat)
lines = read_file("data/" + diet_file_name)  # there should only be 1 line
diet_plans = lines[0].split(",").map(&:strip)  # 1st line is diet plans
# at this point of time, the following variables have been initialized with values read from the CSV files: carbs, protein, fat, diet_plans

# uncomment the following statements if desired
# puts "Read the following data from " + menu_file_name
# puts "carbs   :" + carbs.inspect
# puts "protein :" + protein.inspect
# puts "fat     :" + fat.inspect
# puts
# puts "Read the following data from " + diet_file_name
# puts "diet_plans :" + diet_plans.inspect
# puts

# run the test case
puts "Invoking your select_meals method now..."
start_time = Time.now
solution = select_meals(carbs, protein, fat, diet_plans)
time_taken = Time.now - start_time

# ----- solution testing code (does not test for correctness) ------ 

# check for format of solution
if (solution == nil)
  # error
  puts "Error : your method returned nil. It should return an array of " + diet_plans.length.to_s + " integers"
elsif (!solution.kind_of?(Array))
  # error
  puts "Error : your method returned something other than an array. It should return an array of " + diet_plans.length.to_s + " integers"
elsif !solution.all?{|i| i.is_a? Integer}
  # error
  puts "Error : your method returned an array that contains non-integers. It should return an array of " + diet_plans.length.to_s + " integers" 
else 
  # print out your solution
  puts
  puts "Your solution :" + solution.inspect
  puts "This program does not check your solution for correctness.\nPlease refer to the examples in the requirement doc and perform a manual check.\n"  
end
puts "Execution time #{time_taken} seconds." # display time lapsed
puts 
