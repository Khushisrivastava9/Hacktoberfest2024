# This method reads two integers from the input, sums them, and prints 'YES' if the sum is greater than 6, otherwise prints 'NO'.
# 
# Implementation and Logic:
# 1. The method `solve` is defined without any parameters.
# 2. It reads a line of input using `gets`, which is expected to contain two space-separated integers.
# 3. The input string is split into an array of substrings using `split`.
# 4. Each substring is converted to an integer using `map(&:to_i)`.
# 5. The two integers are assigned to variables `x` and `y`.
# 6. The sum of `x` and `y` is compared to 6.
# 7. If the sum is greater than 6, it prints 'YES'.
# 8. Otherwise, it prints 'NO'.
#
# Example:
# If the input is "3 4", the sum is 7, which is greater than 6, so the output will be 'YES'.
# If the input is "2 3", the sum is 5, which is not greater than 6, so the output will be 'NO'.
def solve
    x, y = gets.split.map(&:to_i)
    puts x + y > 6 ? 'YES' : 'NO'
    end
    
    t = gets.to_i
    t.times { solve }