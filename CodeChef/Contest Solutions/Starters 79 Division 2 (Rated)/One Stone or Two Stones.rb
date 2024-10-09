# Read the number of test cases from the input
T = gets.chomp.to_i

# Loop through each test case
T.times do
  # Read the two integers x and y from the input
  x, y = gets.chomp.split.map(&:to_i)

  # If x is equal to y, then the result depends on whether x is even or odd
  if x == y
    # If x is even, then CHEFINA wins
    if x.even?
      puts "CHEFINA"
    # If x is odd, then CHEF wins
    else
      puts "CHEF"
    end
  # If x is greater than y, then the result depends on the difference between x and y
  elsif x > y
    # If the difference is greater than or equal to 2, then CHEF wins
    if x - y >= 2
      puts "CHEF"
    # If the difference is 1, then the result depends on whether x is odd or even
    else
      # If x is odd, then CHEFINA wins
      if x.odd?
        puts "CHEFINA"
      # If x is even, then CHEF wins
      else
        puts "CHEF"
      end
    end
  # If y is greater than x, then the result depends on the difference between y and x
  else
    # If the difference is greater than or equal to 2, then CHEFINA wins
    if y - x >= 2
      puts "CHEFINA"
    # If the difference is 1, then the result depends on whether y is even or odd
    else
      # If y is even, then CHEF wins
      if y.even?
        puts "CHEF"
      # If y is odd, then CHEFINA wins
      else
        puts "CHEFINA"
      end
    end
  end
end
