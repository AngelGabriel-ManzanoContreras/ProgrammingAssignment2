## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  # Cached inverse will be stored here
  
  # Function to set a new matrix and reset the cached inverse
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  # Function to get the current matrix
  get <- function() x
  
  # Function to set the cached inverse
  setinverse <- function(inverse) inv <<- inverse
  
  # Function to get the cached inverse
  getinverse <- function() inv
  
  # Return a list of all the above functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix.
## If the inverse has already been calculated (and the matrix has not changed),
## then it retrieves the inverse from the cache.
cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  
  # If the inverse is already cached, return it
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  # Otherwise, compute the inverse and cache it
  data <- x$get()
  inv <- solve(data, ...)  # Assumes the matrix is always invertible
  x$setinverse(inv)
  inv
}
