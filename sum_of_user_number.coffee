sum_of_one_to = (n) -> 
  array = [1..n]
  sum = 0
  for number in array
    sum += number

  console.log sum



three_or_five_sum_to = (n) ->
  array = [1..n]
  sum = 0
  for number in array
    if (number % 3 == 0) || (number % 5 == 0)
      sum += number

  console.log sum