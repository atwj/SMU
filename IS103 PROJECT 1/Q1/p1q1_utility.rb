# p1_utility.rb (v1.1 - with bug corrected)
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

# takes in 4 arguments:
#   - selected_floor : an integer (the floor selected by your algorithm)
#   - target_floors  : an array of integers (the target floors of various people)
#   - energy_up      : an integer (the number of units of energy required to go up 1 floor by foot)
#   - energy_down    : an integer (the number of units of energy required to go down 1 floor by foot)
# returns the number of energy units required for each person to walk to his respective target floor
def get_energy_required(selected_floor, target_floors, energy_up, energy_down)
  energy_required = 0
  
  for target in target_floors
    if selected_floor < target
      # need to walk up
      energy_required += (target - selected_floor) * energy_up
    elsif selected_floor > target
      # need to walk down
      energy_required += (selected_floor - target) * energy_down
    end
  end
  
  return energy_required
end