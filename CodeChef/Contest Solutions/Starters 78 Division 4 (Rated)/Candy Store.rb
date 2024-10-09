
MOD = 1_000_000_007
SIZE = 1e6 + 2


# This method solves a problem where given two integers x and y, it determines the minimum cost to buy y candies
# if the cost of each candy is 1 unit for the first x candies and 2 units for each additional candy beyond x.
# 
# Implementation and Logic:
# - The method reads two integers x and y from the input.
# - If x is greater than or equal to y, it means we can buy all y candies at the cost of 1 unit each.
# - If x is less than y, we buy the first x candies at the cost of 1 unit each, and the remaining (y - x) candies at the cost of 2 units each.
# - The method then prints the total cost based on the above conditions.

def solve
  # Read two integers from the input and convert them to integers
  x, y = gets.split.map(&:to_i)
  
  # Check if x is greater than or equal to y
  if x >= y
    # If true, print y as the total cost (since each candy costs 1 unit)
    puts y
  else
    # If false, calculate the total cost:
    # - x candies at 1 unit each
    # - (y - x) candies at 2 units each
    puts x + (y - x) * 2
  end
end


t = gets.to_i


t.times { solve }
