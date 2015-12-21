
puts "enter any whole, positive number:"
n = gets.chomp.to_i

if n == 0
  puts "must give an actual number greater than 0"
else
  i = 0
  while n != 1 do
    if n.even?
      n = n/2
    elsif n.odd?
      n = 3 * n + 1
    end
    puts n
    i += 1
  end

  puts "number of steps: #{i}"
end

