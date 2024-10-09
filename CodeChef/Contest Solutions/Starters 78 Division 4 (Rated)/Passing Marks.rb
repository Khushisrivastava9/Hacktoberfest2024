# Ruby code for finding minimum difference

t = gets.chomp.to_i

t.times do
  # This script reads two integers from the standard input.
  # The first integer 'n' represents the number of students.
  # The second integer 'x' represents the passing marks.
  # The script is intended to process these inputs to determine
  # which students have passed based on their marks.
  # 
  # Implementation and Logic:
  # 1. Read the input from the user.
  # 2. Split the input string into an array of substrings.
  # 3. Convert each substring to an integer.
  # 4. Assign the first integer to 'n' (number of students).
  # 5. Assign the second integer to 'x' (passing marks).

  # Read input from the user, split it into an array of strings,
  # and convert each string to an integer.
  # Assign the first integer to 'n' and the second to 'x'.
  n, x = gets.chomp.split.map(&:to_i)
  a = gets.chomp.split.map(&:to_i)
  a.sort!
  if x == n
    puts a[0] - 1
  else
    puts a[n - x] - 1
  end
end