number = rand(10) + 1

puts "Welcome to my guessing game"
puts "-" * 20

won = false

5.times do
print "Guess my number (1-10) >"
guess = gets.to_i

    if guess == number
      won = true      
    break
    end
end

if won
  puts "You win"
else
  puts "You lost" + " The correct answer was #{number}" 
end
  

