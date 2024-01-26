# Testing testing
# --------------------------------------------------
# Feiyi's trial: don't know what functions to use
# Part 1: Count the number of opening parenthesis (a) and closing parenthesis (b). The floor number is equal to a-b
# Part 2: each time we run sum(), test if the output equals -1?

# Summary
# Part1: 用readLine() to read text lines, strsplit(), 了解dictionary data structure (结合key和sum()做运算)
# Part2: 看累加的结果何时为-1，累加用cumsum()
# first character联想累加所得结果的minimum

# Solution --------------------------------------------------
# https://emilhvitfeldt.github.io/rstats-adventofcode/2015.html

# Part 1
input <- readLines("2015/data/day1_data.txt") # readLine: read text lines from a connection
chars <- strsplit(x = input, split = "")[[1]] 
class(strsplit(x = input, split = ""))
# Split the elements of a character vector x into substrings 
# according to the matches to substring split within them.

key <- c("(" = 1, ")" = -1) 
# A dictionary has a set of keys and each key has a single associated value.

sum(key[chars]) # 280


# Part 2
min(which(cumsum(key[chars]) < 0)) # 1797 or 
min(which(cumsum(key[chars]) == -1)) # 1797

# Question: is cumsum faster than a for/while loop?

vec <- c("a" = 1, "b" = 2)
chars2 <- c("a", "a", "b", "a")
sum(vec[chars2]) # 5

# Other members transform the input to data frame.