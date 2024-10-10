# This method takes a single integer as input, which represents the number of elements in an array.
# It then reads the array from the input, and for each element in the array, it adds the element to a running total.
# If the running total is equal to the index of the element plus one, then it increments a counter.
# The method then prints the counter.
def solve()
    # Read the number of elements in the array from the input
    n = gets.chomp.to_i
    
    # Read the array from the input
    v = gets.chomp.split.map(&:to_i)
    
    # Initialize the running total and the counter
    score = 0
    cnt = 0
    
    # Iterate through the array
    i = 0
    while i < n do
        # Add the current element to the running total
        score += v[i]
        
        # If the running total is equal to the index of the element plus one,
        # then increment the counter
        if score == (i + 1)
            cnt += 1
        end
        
        # Move on to the next element in the array
        i += 1
    end
    
    # Print the counter
    puts cnt
end

# Read the number of test cases from the input
t = gets.chomp.to_i

# Loop through each test case
while t > 0 do
    # Call the solve method
    solve()
    
    # Decrement the test case counter
    t -= 1
end
