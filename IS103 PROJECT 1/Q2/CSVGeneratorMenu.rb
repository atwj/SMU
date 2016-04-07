# CSV Generator (for menu files)
#
# format of CSV file generated
#   1st row (row0): carbs
#   2nd row (row1): protein
#   3rd row (row2): fats

# Boundaries
# Each of the rows (carbs, protein and fat) will contain at least 1 randomly-generated integer. 
# Each of these integers will be a randomly-generated number between 0 and 100 (inclusive).

# get user input
print "Enter number of menu items (at least 1):"
no_of_menu_items = gets.to_i

print "Enter name of CSV file (e.g. menu_dumb.csv):"
file_name = "data\\" + gets.chomp  # file will always be generated in the data folder

# generate content
row0 = ""
row1 = ""
row2 = ""
for i in 0...no_of_menu_items
  row0 += rand(101).to_s 
  row1 += rand(101).to_s 
  row2 += rand(101).to_s 
  
  # add a comma behind only if it's not the last iteration
  if i < no_of_menu_items-1
    row0 += ", "
    row1 += ", "
    row2 += ", "
  end  
end
content = row0 + "\n" + row1 + "\n" + row2

# uncomment the following lines if you want the contents of the new file displayed
# puts
# puts "contents:\n" + content
# puts

# write to file
File.open(file_name, 'w') { |file| file.write(content) }
puts "Created " + file_name + ". Please view it using a text editor."