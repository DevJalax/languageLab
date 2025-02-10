# Welcome the user and ask them to enter an operator
puts "Welcome to the Calculator!"
puts "Please enter an operator (+, -, *, /):"

# Get the operator from the user
operator = gets.chomp

# Ask the user to enter the first number
puts "Please enter the first number:"

# Get the first number from the user
first_number = gets.chomp.to_f

# Ask the user to enter the second number
puts "Please enter the second number:"

# Get the second number from the user
second_number = gets.chomp.to_f

# Perform the requested operation
if operator == "+"
  result = first_number + second_number
elsif operator == "-"
  result = first_number - second_number
elsif operator == "*"
  result = first_number * second_number
elsif operator == "/"
  result = first_number / second_number
else
  puts "Invalid operator!"
end

# Print the result to the user
puts "The result is: #{result}"
