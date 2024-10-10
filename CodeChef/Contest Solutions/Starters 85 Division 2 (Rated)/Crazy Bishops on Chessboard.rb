# Read the number of test cases from the input
t = gets.chomp.to_i

# Loop through each test case
t.times do
  # Read the size of the chessboard from the input
  n = gets.chomp.to_i

  # If the size of the chessboard is less than 3, then there are 0 crazy bishops
  if n < 3
    puts 0
  else
    # Calculate the number of crazy bishops
    # The number of crazy bishops is 2 plus the number of bishops on the black squares minus the number of bishops on the white squares
    # The number of bishops on the black squares is (n - 1) / 2
    # The number of bishops on the white squares is n / 2
    # The number of crazy bishops is 2 plus the difference between the number of bishops on the black squares and the number of bishops on the white squares
    # The difference is multiplied by 3 because each crazy bishop can attack 3 squares
    puts 2 + (((n - 1) / 2) - (n / 2)) * 3
  end
end
