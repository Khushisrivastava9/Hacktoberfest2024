# Read the number of test cases from the input
t = gets.to_i

# Loop through each test case
t.times do
  # Read the length of the string from the input
  n = gets.to_i

  # Read the string from the input
  s = gets.chomp

  # Initialize an empty stack
  st = []

  # Initialize a counter to keep track of the number of operations
  cnt = 0

  # Loop through each character in the string
  s.chars.each do |i|
    # If the stack is not empty and the current character is not equal to the top of the stack
    if !st.empty? && st.last != i
      # Pop the top of the stack
      st.pop

      # Increment the counter
      cnt += 1
    else
      # Push the current character onto the stack
      st.push(i)
    end
  end

  # If the counter is odd, print "Zlatan"
  # Otherwise, print "Ramos"
  puts cnt.odd? ? "Zlatan" : "Ramos"
end
