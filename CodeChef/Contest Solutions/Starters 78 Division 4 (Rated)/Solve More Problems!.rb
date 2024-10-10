# This method solves a problem where you are given two arrays `a` and `b` of length `n`, 
# and an integer `k`. The goal is to maximize the number of elements you can select from 
# the arrays such that the sum of the selected elements from both arrays does not exceed `k`.
# The elements are selected based on a specific sorting and selection strategy.
#
# Implementation and Logic:
# 1. Read the input values for `n` (number of elements) and `k` (maximum allowed sum).
# 2. Read the arrays `a` and `b`.
# 3. Combine the arrays `a` and `b` into pairs and sort them based on the sum of the pairs 
#    and then by the first element of the pair.
# 4. Initialize variables to keep track of the current sum (`sum`), the maximum value from 
#    the second array (`mx`), and the index (`i`).
# 5. Iterate through the sorted pairs and keep adding the sums to `sum` until adding another 
#    pair would exceed `k`.
# 6. Create an array `mn` to store the minimum values from the first array starting from the 
#    end of the sorted pairs.
# 7. Calculate the maximum number of elements that can be selected (`ans`).
# 8. Check if adding one more element is possible by considering the remaining sum and the 
#    minimum values in `mn`.
# 9. Return the final answer (`ans`).

def solve
  # Read the number of elements and the maximum allowed sum
  n, k = gets.split.map(&:to_i)
  
  # Read the two arrays
  a = gets.split.map(&:to_i)
  b = gets.split.map(&:to_i)
  
  # Combine the arrays into pairs and sort them by the sum of the pairs and then by the first element
  m = a.zip(b).sort_by { |x| [x.sum, x.first] }
  
  # Initialize variables
  mx = 0
  sum = 0
  i = 0
  
  # Iterate through the sorted pairs
  while i < n
    # Check if adding the current pair would exceed the maximum allowed sum
    if m[i].sum + sum <= k
    # Add the sum of the current pair to the total sum
    sum += m[i].sum
    # Update the maximum value from the second array
    mx = [mx, m[i][1]].max
    # Move to the next pair
    i += 1
    else
    # Break the loop if adding the current pair would exceed the maximum allowed sum
    break
    end
  end
  
  # Create an array to store the minimum values from the first array starting from the end
  mn = Array.new(n)
  (n - 1).downto(0) do |k|
    if k == n - 1
    mn[k] = m[k][0]
    else
    mn[k] = [mn[k + 1], m[k][0]].min
    end
  end
  
  # Initialize the answer with the number of pairs added so far
  ans = i
  
  # Check if adding one more element is possible
  if i < n
    rem = k - sum
    if mn[i] <= rem
    ans += 1
    elsif rem + mx >= m[i].sum
    ans += 1
    end
  end
  
  # Return the final answer
  ans
  end