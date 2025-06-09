# Load your functions (make sure cachematrix.R is in the same directory)
source("cachematrix.R")

# Test 1: Basic 2x2 invertible matrix
cat("Test 1: 2x2 Matrix\n")
mat1 <- matrix(c(4, 3, 3, 2), 2, 2)
cm1 <- makeCacheMatrix(mat1)

inv1_first <- cacheSolve(cm1)
cat("First inverse (computed):\n")
print(inv1_first)

inv1_cached <- cacheSolve(cm1)
cat("Second inverse (cached):\n")
print(inv1_cached)

# Check if both are equal
cat("Identical results? ", identical(inv1_first, inv1_cached), "\n\n")

# Test 2: Change the matrix and verify inverse is recalculated
cat("Test 2: Changing matrix\n")
cm1$set(matrix(c(1, 2, 3, 4), 2, 2))

inv2 <- cacheSolve(cm1)
cat("New inverse (after reset):\n")
print(inv2)

# Test 3: Check if cache is used again
cat("Test 3: Cached inverse again\n")
inv2_cached <- cacheSolve(cm1)
print(inv2_cached)

cat("Identical results? ", identical(inv2, inv2_cached), "\n")
