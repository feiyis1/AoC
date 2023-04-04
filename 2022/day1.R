# https://adventofcode.com/2022/day/1
# How to split vector and data frame in R:
# https://www.r-bloggers.com/2021/12/how-to-split-vector-and-data-frame-in-r/

# The Elves take turns writing down the number of Calories contained by the 
# various meals, snacks, rations, etc. that they've brought with them, 
# one item per line. Each Elf separates their own inventory from the 
# previous Elf's inventory (if any) by a blank line.

# Feiyi's thoughts: split data into groups by space.
# but don't know how to. mimic 2015 day 1 strsplit()?

# Summary:
# 1. split(): divides the vector x into groups defined by f. 
# 2. Understand the difference between sapply(), vapply(), and lapply().
# 3. Learn about sort() function in base R.

# Part 1
# Expected output: a number
data <- readLines("2022/data/day1_data.txt")
data <- as.numeric(data) # use as.numeric because we will do addition later. NAs appear.

split(x = data, f = cumsum(is.na(data))) |> # cumsum(is.na(data)): add 1 if a NA occurs. split() returns a list.
  # sapply() and vapply() are very similar to lapply() except they simplify 
  # their output to produce an atomic vector. While sapply() guesses, 
  # vapply() takes an additional argument specifying the output type.
  vapply(FUN = sum, na.rm = TRUE, FUN.VALUE = numeric(1)) |>
  max()

# splitat

# Part 2
# By the time you calculate the answer to the Elves' question, 
# they've already realized that the Elf carrying the most Calories of food 
# might eventually run out of snacks.
# To avoid this unacceptable situation, the Elves would instead like to know 
# the total Calories carried by the top three Elves carrying the most Calories. 
# That way, even if one of those Elves runs out of snacks, they still have two backups.
# Find the top three Elves carrying the most Calories.
# How many Calories are those Elves carrying in total?

split(x = data, f = cumsum(is.na(data))) |> # cumsum(is.na(data)): add 1 if a NA occurs. split() returns a list.
  # sapply() and vapply() are very similar to lapply() except they simplify 
  # their output to produce an atomic vector. While sapply() guesses, 
  # vapply() takes an additional argument specifying the output type.
  vapply(FUN = sum, na.rm = TRUE, FUN.VALUE = numeric(1)) |>
  sort(decreasing = TRUE) |>
  head(3) |>
  sum()



