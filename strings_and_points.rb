# Instructions:
# Please do the following exercises in the language of your choice, and send the answers back to me as soon as you are finished. Please take computational complexity into account as you implement your solutions (more efficient solutions are preferable). Also, please include a brief, informal analysis of the computational complexity of your solutions.

# Question 1: String prefixes.
# Given a collection of strings, answer the question: Is any string in the collection a prefix of another?

# Question 2: closest points.
# Given a collection of points in 3d space (x, y, z), find the k closest points to the origin. For example, if k = 20, then find the 20 closest points to the origin. Assume that k is small enough to fit in memory, but the number of points is too large to fit in memory (assume you will have a function that gets the next point, or indicates that there are no points remaining).

# Question 3: Subsets.
# Given a collection of strings, output all possible subsets.
# These are sets, so the order of the elements in the set does not matter nor does the order with which you output the sets.

# For example, given the set {a, b, c, d}

# output:
# {}
# {a}
# {b}
# {c}
# {d}
# {a, b}
# {a, c}
# {a, d}
# {b, c}
# {b, d}
# {c, d}
# {a, b, c}
# {a, b, d}
# {a, c, d}
# {b, c, d}
# {a, b, c, d}

# Answer no. 2


# Answer no. 3

set = ["a", "b", "c", "d", "e", "f"]

1.upto(6).flat_map.each do |number|
  set.combination(number).to_a
end


1.upto(6).flat_map { |n| set.combination(n).to_a }

