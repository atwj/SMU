#BINARY SEARCH
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

#INTERPOLATION SEARCH
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

#MODIFIED INTERPOLATION SEARCH
def modified_interpolation_search(array, key, cdf)
	startTime = Time.now
	p_value = cdf[index(key,2)]
	mean = p_value * array.length
	sqrt = p_value * (1 - p_value) * array.length
	sd = Math.sqrt(sqrt.abs)
	low = [0,(mean - 3 * sd).to_i].max
	high = [array.length - 1, (mean + 3 * sd).to_i].min

	if array[low] > key
		return binary_search(array[0..low], key)
	elsif array[high] < key
		return binary_search(array[high..array.length-1],key)
	else
		return binary_search(array[low..high],key)
	end
end


#computes the CDF
def cdf(array)

	a_freq = {}
	a_cdf = {}

	array.each{|x| a_freq.has_key?(index(x, 2)) ? a_freq[index(x, 2)] += 1 : a_freq[index(x, 2)] = 1}
	keys = a_freq.keys
	a_cdf[keys[0]] = 1.0 * a_freq[keys[0]] / array.length
	for i in 1...keys.length
		a_cdf[keys[i]] = a_cdf[keys[i-1]] + (1.0 * a_freq[keys[i]] / array.length)
	end
	return a_cdf
end

#Indexes a string
def index(string, no_of_letters)
	index = 0
	a_value = 0
	array = string.bytes.to_a
	"a".each_byte{|x| a_value = x}
	index = 26 * (array[0] - a_value)
	for i in 1...no_of_letters
		index += (array[i] - a_value)
	end
	return index
end
