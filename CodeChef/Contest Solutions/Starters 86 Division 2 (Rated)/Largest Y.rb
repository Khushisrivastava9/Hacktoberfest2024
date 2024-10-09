
# Read the number of test cases from the input
t = gets.to_i

# Loop through each test case
t.times do
  # Read the number of elements in the array and the integer x from the input
  n, x = gets.split.map(&:to_i)

  # Read the array from the input
  a = gets.split.map(&:to_i)

  # Initialize the answer with 0
  ans = 0

  # Initialize the index with 0
  i = 0

  # Loop through each bit in the binary representation of x (up to 30 bits)
  30.times do
    # Initialize the mask with 0
    m = 0

    # Initialize the index with 0
    j = 0

    # Loop through each element in the array
    while j < n
      # Calculate the bit at the current index in the element
      bit = (a[j] >> i) & 1

      # Update the mask with the value of the bit
      m |= 1 << bit

      # Move on to the next element in the array
      m |= 1 << ((a[j] >> i) & 1)
      j += 1
    end

    # If the mask is not equal to 3, then move on to the next bit
    if m != 3
      i += 1
      next
    end

    # Initialize the temporary integer with the value of x
    t = x

    # If the bit at the current index in x is 1, then flip the bit
    if t & (1 << i) != 0
      t ^= 1 << i

      # Initialize the index with the current index minus 1
      k = i - 1

      # Loop while the index is greater than or equal to 0
      while k >= 0
        # Set the bit at the current index in the temporary integer to 1
        t |= 1 << k

        # Decrement the index by 1
        k -= 1
      end
    end

    # Update the answer with the maximum of the current answer and the temporary integer
    ans = [ans, t].max

    # Increment the index by 1
    i += 1
  end

  # Print the answer
  puts ans
end
