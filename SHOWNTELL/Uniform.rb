
a = Array(0..10000000)
a_size = a.length

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


#generate random numbers
no_of_numbers = 100
random_numbers = []
for i in 0...no_of_numbers
	n = rand(a_size - 1) #random numbers from 
	random_numbers << a[n]
end


#running binary search
puts "Running Binary Search.."
binary_search_result = []
startTime = Time.now
for i in 0...random_numbers.length
	binary_search_result << binary_search(a, random_numbers[i])
end
binary_search_time = Time.now - startTime

#runnning interpolation search
puts "Running Interpolation Search.."
inter_search_result = []
startTime = Time.now
for i in 0...random_numbers.length
	inter_search_result << binary_search(a, random_numbers[i])
end
inter_search_time = Time.now - startTime


puts "binary search result : "
puts "OK!" if !binary_search_result.include?(false)
puts "interpolation search result : "
puts "OK!" if !inter_search_result.include?(false)
puts "binary search time: #{binary_search_time}"
puts "interpolation search time: #{inter_search_time}"














