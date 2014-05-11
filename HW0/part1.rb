#Define a method sum which takes an array of integers as an argument and 
#returns the sum of its elements. For an empty array it should return zero.
def sum(ary)
	ary.reduce(0, &:+)
end

#Define a method max_2_sum which takes an array of integers as an argument and 
#returns the sum of its two largest elements. For an empty array it should 
#return zero. For an array with just one element, it should return that element.
def max_2_sum(ary)
	return 0 if ary.count == 0
	return ary[0] if ary.count == 1
	ary.sort.last(2).reduce(&:+)
end 

# Define a method sum_to_n? which takes an array of integers and an additional integer, n,
# as arguments and returns true if any two elements in the array of integers sum to n.
# An empty array should sum to zero by definition.
def sum_to_n?(ary,n)
	h = Hash[ary.map.with_index {|x,i| [x,i] }]

	ary.each_with_index do |x,i|
		y = n - x
		return true if (h[y] and h[y] != i)
	end
	return false
end