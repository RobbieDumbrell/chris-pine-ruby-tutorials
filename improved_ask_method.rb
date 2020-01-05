# taking the answer variable out 

def ask question
	while true
		puts question
		reply = gets.chomp.downcase

		if (reply == "yes" || reply == "no")
			if reply == "yes"
				return true
			else
				return false
			end
			break
		else
			puts "Please answer \"yes\" or \"no\"."
		end
	end
end

puts "Hello, and thank you for taking the time to"
puts "help me with this experiment. My experiment"
puts "has to do with the way people feel about"
puts "Mexican food. Just think about Mexican food"
puts "and try to answer every question honestly"
puts "with either a \"yes\" or a \"no\". My experiment"
puts "has nothing to do with bed-wetting."

puts ""

ask "Do you like eating tacos?"
ask "Do you like eating burritos?"
wets_bed = ask "Do you wet the bed?" #saves the return value by assigning a variable to it
ask "Do you like eating chimichangas?"
ask "Do you like eating sopapillas?"
puts "Just a few more questions..."
ask "Do you like drinking horchata?"
ask "Do you like eating flautas?"

puts ""
puts "DEBRIEFING"
puts "Thank you for taking the time to help with"
puts "this experiment. In fact, this experiment"
puts "has nothing to do with Mexican food. It is"
puts "an experiment about bed-wetting. The Mexican"
puts "food was just in there to catch you off guard"
puts "honestly. Thanks again!"

puts ""

if wets_bed == true
	puts "Haha, you wet the bed! XD"
else 
	puts "Well done! You don't wet the bed!"
end