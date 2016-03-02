# Name: TAN WEI JIE AMOS
# Section: G1

# lab2a

# INSTRUCTIONS: 
# Refer to the code in lab2a_main.rb - perform_once will be called one time before 
# exist? is called many times. You may insert any code you want into perform_once
def perform_once
  # write any code here if desired. You may keep this method empty as well.
  # you may use $employee_list here
  
  #$hash = {} 
  #$employee_list.each{|x| $hash[x] = nil}
  $array = $employee_list
end
# INSTRUCTIONS: 
# This method is a fully functioning method that uses sequential search to search for the id in $employee_list.
# This method returns true (if this ID exists), or false otherwise.
# Modify this method so that it performs significantly faster.
def exist?(key)
  	array = $array
  	interpolation_search(array,key)
  	#binary_search(array, key)
end

def binary_search(array, key)
	start = 0
	ending = array.length

	while start <= ending
		middle = (ending + start) / 2  
		#return true when value is found 
		return true if array[middle] == key

		if array[middle] < key
			start = middle + 1 
		else
			ending = middle - 1 
		end
	end
	return false
end

def interpolation_search(array, key)
	low = 0
	high = array.length - 1

	while array[high] >= key && array[low] < key
		rise = high - low
		run = array[high] - array[low]
		x = key - array[low]
		index = (rise / run) * x + low
		
		if key < array[index]
			high = index - 1
		elsif key > array[index]
			low = index + 1
		else
			low = index
		end
	end

	if(array[low] == key)
		return true
	else
		return false
	end
end