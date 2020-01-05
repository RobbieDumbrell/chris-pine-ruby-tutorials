def english_number number
	if number < 0 # No negative numbers...
		return "Please enter a number that isn't negative."
	end
	if number == 0 
		return "zero"
	end

	# No more special cases...
	num_string = "" # This is the string we will return.

	ones_place = ["one",       "two",       "three", 
				  "four",      "five",      "six", 
				  "seven",     "eight",     "nine"]

	tens_place = ["ten",       "twenty",    "thirty",
				  "forty",     "fifty",     "sixty",
				  "seventy",   "eighty",    "ninety"]

	teens      = ["eleven",    "twelve",    "thirteen",
				  "fourteen",  "fifteen",   "sixteen", 
				  "seventeen", "eighteen",  "nineteen"]

	zillions = [["hundred",             2],
				["thousand",            3],
				["million",             6],
				["billion",				9],
				["trillion",			12],
				["quadrillion",			15],
				["quintillion",			18],
				["sextillion",			21],
				["septillion",			24],
				["octillion",			27],
				["nonillion",			30],
				["decillion",			33]]

	# "left" is how much of the number we still have left to write out.
	# "write" is the part we are writing out right now.

	left = number

	while zillions.length > 0
		zil_pair = zillions.pop
		zil_name = zil_pair[0]
		zil_base = 10 ** zil_pair[1]

		write = left/zil_base     # How many zillions left?
		left = left - write*zil_base    #Subtract those zillions.

		if write > 0
			prefix = english_number write # recursion
			num_string = num_string + prefix + " " + zil_name

			if left > 0 
				num_string = num_string + " "
			end
		end
	end

	write = left/10     # How many tens left?
	left = left - write*10    #Subtract off those tens.

	if write > 0
		if ((write == 1) and (left > 0))
			# these are the teens so are different...
			num_string = num_string + teens[left-1]
			left = 0
		else 
			num_string = num_string + tens_place [write-1]
		end

		if left > 0 
			num_string = num_string + "-"
		end
	end

	write = left    # How many ones left to write out?
	left = 0    # Subtract those ones.

	if write > 0
		num_string = num_string + ones_place[write-1]
	end

	return num_string
end




puts ""
puts "How many bottles of beer are there on the wall?"

amount_of_bottles = gets.chomp.to_i

puts ""

while amount_of_bottles > 2

	puts english_number(amount_of_bottles).capitalize + " bottles of beer on the wall, " + english_number(amount_of_bottles) + " bottles of beer!"

	amount_of_bottles = amount_of_bottles - 1

	puts "You take one down, and pass it around, there's " + english_number(amount_of_bottles) + " bottles of beer on the wall!"

end

puts "Two bottles of beer on the wall, two bottles of beer!"
puts "You take one down, and pass it around, there's 1 bottle of beer on the wall!"
puts "One bottle of beer on the wall, one bottle of beer!"
puts "You take one down, and pass it around, there are no more bottles of beer on the wall!"
puts ""
puts "Woop!"

