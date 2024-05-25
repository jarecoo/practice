### me, when i fizz and buzz

numbers = (1..100).to_a
numbers.each do |numberooski|
  if numberooski % 5 == 0 && numberooski % 3 == 0
    p "FIZZBUZZ"
  elsif numberooski % 3 == 0
    p "FIzz"
  elsif numberooski % 5 == 0
    p "buZZ"
  else
    p numberooski
  end
end
