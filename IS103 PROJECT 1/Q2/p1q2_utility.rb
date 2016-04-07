# p1q2_utility.rb
# Do not submit this file
# Do not modify this file as well. 

# Ensure that this file is in the same folder as lab3_main.rb

# takes in an array of strings and returns the same array with all the strings converted to integers
# e.g. input: ["3", "4", "8", "-1"]. returns [3, 4, 8, -1]
def convert_array_elements_to_i(array)
  for i in 0..array.length-1
    array[i] = array[i].to_i
  end
end

# reads a CSV file and returns an array of strings - each line in the CSV file as one string
def read_file(file)
	lines = IO.readlines(file)
	if lines != nil
		for i in 0 .. lines.length-1
			lines[i] = lines[i].sub("\n","")
		end
		return lines[0..lines.length-1]
	end
	return nil
end

