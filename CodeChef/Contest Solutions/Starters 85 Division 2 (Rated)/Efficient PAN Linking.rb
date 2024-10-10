# This method takes a string as input and prints the last two characters of the string concatenated together.
# If the string has only one character, it prints the character itself.
# The characters are treated as integers and concatenated together.
# The result is printed as a string.
def solve()
    # Read the string from the input
    s = gets.chomp

    # If the string has more than one character
    if s.size > 1
      # Get the last two characters of the string
      ch1 = s[-1].to_i
      ch2 = s[-2].to_i % 2

      # Concatenate the two characters together and print the result
      puts (ch2 * 10 + ch1).to_s
    else
      # If the string has only one character, print it
      ch1 = s[-1].to_i
      puts ch1.to_s
    end
  end

  # Read the number of test cases from the input
  t = gets.to_i

  # Loop through each test case
  while t > 0
    # Call the solve method
    solve()
    # Decrement the number of test cases
    t -= 1
  end
