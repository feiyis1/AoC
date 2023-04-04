# Summary
# 1. Practice for loop
# 2. Learn about combn {utils} function which can generate all combinations of 
# n elements taken m at a time.

# Resources: method 2 comes from https://www.r-bloggers.com/2020/12/advent-of-code-2020/

data <- readLines("2020/data/day1_data.txt")
data <- as.numeric(data)

# Part 1 --------------
# Before you leave, the Elves in accounting just need you to fix your expense 
# report (your puzzle input); apparently, something isn't quite adding up.
# Specifically, they need you to find the two entries that sum to 2020 and 
# then multiply those two numbers together.

# Method 1: for loop
# 用第一个element和之后所有elements一一相加，看是否等于2020
# 再用第二个element之后所有一一相加，以此类推
sum_2 <- function(data, target) {
  for (i in data) {
    for (j in data) {
      if (i + j == target & i != j) {
        return (i * j)
      }
    }
  }
}
sum_2(data, 2020) # 935419

# Method 2
# 2000 minus the first element in the data will also occur in the data
prod(data[(2020 - data) %in% data])

# Part 2 --------------
# The Elves in accounting are thankful for your help; one of them even offers you 
# a starfish coin they had left over from a past vacation. They offer you a 
# second one if you can find three numbers in your expense report that meet 
# the same criteria.
# In your expense report, what is the product of the three entries that sum to 2020?

# Method 1: for loop again
sum_3 <- function(data, target) {
  for (i in data) {
    for (j in data) {
      for (z in data) {
        if (i + j + z == 2020 & i != j & i != z & j != z) {
          return(i * j * z)
        }
      }
    }
  }
}
sum_3(data, 2020) # 49880012

# Method 2: 
var_3 <- combn(data, 3, FUN = NULL)[, combn(data, m = 3, FUN = sum) == 2020]
# FUN = NULL: get the identity or return the combination which is a vector of 
# lenght m. Need the comma in the bracket. Otherwise, the answer is wrong.
# But not sure why.
prod(var_3) # 49880012
