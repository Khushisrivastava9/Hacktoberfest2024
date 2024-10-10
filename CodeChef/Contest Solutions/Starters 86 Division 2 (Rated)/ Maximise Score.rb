# Read the number of test cases from the input
t = gets.chomp.to_i

# Loop through each test case
t.times do
  # Read the number of elements in the array from the input
  n = gets.chomp.to_i

  # Read the array from the input and convert each element to an integer
  a = gets.chomp.split.map(&:to_i)

  # Initialize the answer with infinity
  ans = Float::INFINITY

  # Initialize the index with 0
  i = 0

  # Loop until the index is greater than or equal to the number of elements in the array
  loop do
    # Initialize the maximum difference with 0
    mx = 0

    # If the index is not at the first element, calculate the difference between the current element and the previous element
    # and update the maximum difference if the calculated difference is greater
    mx = [mx, (a[i + 1] - a[i]).abs].max if i + 1 < n

    # If the index is not at the last element, calculate the difference between the current element and the next element
    # and update the maximum difference if the calculated difference is greater
    mx = [mx, (a[i - 1] - a[i]).abs].max if i - 1 >= 0

    # Update the answer with the minimum of the current answer and the maximum difference
    ans = [ans, mx].min

    # Increment the index by 1
    i += 1

    # Break the loop if the index is greater than or equal to the number of elements in the array
    break if i >= n
  end

  # Print the answer
  puts ans
end
