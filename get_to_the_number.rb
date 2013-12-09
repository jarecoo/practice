# needs to account for typos, capitalizations, periods, backspacing


puts
puts "THE RULES: You will be asked four times to choose
whether you want a small nubmer (between 1 and 10),
or a big number (between 10 and 99).
These nubmers, plus one number from 100-500,
will be generated for you. With these 5 numbers,
you must use any standard math operator
# to reach a 6th number between 500 and 1000."

puts
puts "--Let's Begin--"
puts

numbers = []
n = rand(100..500) #should be multiples of 100
random_number = n - (n % 100)
numbers << random_number

4.times do |i|
  if i % 4 == 0
    p "Would you like a big number or small number?"
  elsif i % 4 == 3
    p "Final time: big or small?"
  else
    p "Please pick big or small again"
  end
  response = gets.chomp

  if response == "big"
    n = rand 10..95
    random_number = n - (n % 5)
    numbers << random_number
  elsif response == "small"
    random_number = rand 1..10
    numbers << random_number
  end
end

puts
p numbers
puts "^^ Your numbers ^^"
puts
p rand(500..1000)
puts "^^^ The nubmer you must reach using them"
puts
puts "Good luck."
# (In some later version of this game, it will know at least one answer.
# Sorry, you're on your own.)"
puts
