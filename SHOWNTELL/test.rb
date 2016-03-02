load "lab2_utility.rb"
load "codes.rb"
DATA_FILE_NAME = "words.csv"

dictionary = []
read_file("data/"+DATA_FILE_NAME).each{ |line| 
  dictionary << line.strip.downcase
}


dictionary.reject!{|x| x.length < 2}
dictionary.uniq!
dictionary.sort!
dictionary_size = dictionary.length
p "size of dictionary : " + dictionary_size.to_s
#generate random words
no_of_words = 100
random_words = []
for i in 0...no_of_words
	n = rand(dictionary_size - 1) #random numbers from 
	random_words << dictionary[n]
end
# p random_words
puts "#{no_of_words} random word(s) generated.."
puts "Starting test now.."

#running binary search
puts "Running Binary Search.."
binary_search_result = []
startTime = Time.now
for i in 0...random_words.length
	binary_search_result << binary_search(dictionary, random_words[i])
end
binary_search_time = Time.now - startTime

#runnning interpolation search
puts "Running Interpolation Search.."
inter_search_result = []
startTime = Time.now
for i in 0...random_words.length
	inter_search_result << binary_search(dictionary, random_words[i])
end
inter_search_time = Time.now - startTime

#running modified interpolation search
puts "Running Modified interpolation search.."
mod_inter_search_result = []
cdf = cdf(dictionary)
startTime = Time.now
for i in 0...random_words.length
  mod_inter_search_result << modified_interpolation_search(dictionary, random_words[i], cdf)
end
mod_inter_search_time = Time.now - startTime


puts "Results:"
puts "binary search result : "
puts "OK!" if !binary_search_result.include?(false)
puts "interpolation search result : "
puts "OK!" if !inter_search_result.include?(false)
puts "modified interpolation search result : "
puts "OK!" if !mod_inter_search_result.include?(false)

puts "binary search time: #{binary_search_time}"
puts "interpolation search time: #{inter_search_time}"
puts "modified interpolation search time: #{mod_inter_search_time}"