# CSV Generator (for diet plan files)

# Boundaries:
# - CSV file generated will only contain 1 row
# - This row will contain at least 1 string, but may contain any number of strings separated by commas
# - Each string will be between 0 and 4 characters in length (inclusive), 
#   and will contain only the following characters: CcPpFfTt.
# - It is possible that diet plans generated can be counter-intuitive (e.g. "cCp" and "ttp").

# get user input
print "Enter number of diet plans (at least 1):"
no_of_diet_plans = gets.to_i

print "Enter name of CSV file (e.g. diet_dumb.csv):"
file_name = "data\\" + gets.chomp  # file will always be generated in the data folder

# generate content
content = ""
for i in 0...no_of_diet_plans

  current_diet_plan = ""
 
  # generate random diet plan string first (0-4 chars)
  random_diet_plan = "CcPpFfTt".split('').shuffle.join # reshuffle characters in string
  random_diet_plan = random_diet_plan[0...rand(5)] # randomly grab the first 0-4 characters
  
  content += random_diet_plan

  # add a comma behind only if it's not the last iteration
  if i < no_of_diet_plans-1
    content += ", "
  end
end

# uncomment the following lines if you want the contents of the new file displayed
# puts
# puts "content:" + content
# puts

# write to file
File.open(file_name, 'w') { |file| file.write(content) }
puts "Created " + file_name + ". Please view it using a text editor."
