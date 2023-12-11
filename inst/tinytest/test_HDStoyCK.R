library(data.table)
library(HDStoyCK)

dt1 <- data.table(x = c(letters[1:4], NA), y = 1:5, z = 10:6, om = c(as.numeric(6:3), NA))
dt2 <- data.table(x = c(letters[1:4], NA))
dt3 <- data.table()

# Test function with na.rm = TRUE
expect_equal(rowSumsDT(dt1, na.rm = TRUE), c(17, 16, 15, 14, 11))

# Test function with na.rm = FALSE
expect_equal(rowSumsDT(dt1, na.rm = FALSE), c(17, 16, 15, 14, NA))

# Tests that na.rm = FALSE remains the default
expect_equal(rowSumsDT(dt1), rowSumsDT(dt1, na.rm = FALSE))

# Test for data.table with non numeric columns
expect_null(rowSumsDT(dt2))

# Test for NULL data.table
expect_error(rowSumsDT(dt3))


