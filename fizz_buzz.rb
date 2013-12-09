numbers = (1..100).to_a
numbers.each do |fb|
  if fb % 5 == 0 && fb % 3 == 0
    p "FIZZBUZZ"
  elsif fb % 3 == 0
    p "FIzz"
  elsif fb % 5 == 0
    p "buZZ"
  else
    p fb
  end
end
