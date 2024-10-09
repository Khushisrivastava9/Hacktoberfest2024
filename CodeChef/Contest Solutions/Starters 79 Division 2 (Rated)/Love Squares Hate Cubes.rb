# This method takes an integer n as input and returns the largest cube root of n that is less than or equal to n.
# 
# The method uses a binary search algorithm to find the largest cube root of n.
# 
# The algorithm works as follows:
# 1. Initialize start and endval to 0 and 3e6 (or 3 million) respectively.
# 2. Loop until the difference between endval and start is less than or equal to 1.
# 3. Calculate the midpoint of start and endval (mid).
# 4. If the cube of mid is greater than n, set endval to mid, otherwise set start to mid.
# 5. Repeat steps 2-4 until the loop condition is satisfied.
# 6. Return start as the largest cube root of n that is less than or equal to n.
def find(n)
    start = 0
    endval = 3e6.to_i
    while endval - start > 1
        mid = (start + endval) / 2
        if mid * mid * mid > n
            endval = mid
        else
            start = mid
        end
    end
    return start
end

# This method takes an integer x as input and prints the smallest number y such that y^2 is greater than x and y^3 is greater than or equal to x.
# 
# The method works as follows:
# 1. Read an integer x from the input.
# 2. Initialize num to x.
# 3. Loop until the difference between num and the largest cube root of num * num is greater than or equal to x.
# 4. Calculate the cube of num (tmp).
# 5. Calculate the largest cube root of tmp (cbs).
# 6. Increment num by cbs.
# 7. Repeat steps 3-6 until the loop condition is satisfied.
# 8. Print the square of num.
def solve
    x = gets.chomp.to_i
    
    num = x
    while num - find(num * num) < x
        tmp = num * num
        cbs = find(tmp)
        num = x + cbs
    end
    puts num * num
end

# Read the number of test cases from the input.
# 
# Loop through each test case and call the solve method.
t = gets.chomp.to_i

t.times do
    solve
end
