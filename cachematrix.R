## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  set <- function(y) {
    x <<- y     # Assign new matrix
    inv <<- NULL  # Reset inverse cache 
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse  # Cache the inverse
  getInverse <- function() inv  # Retrieve the cached inverse
  
  # Return a list of all the above functions
  list(set = set, 
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()  # Get the cached inverse
  if (!is.null(inv)) {
    message("getting inversed matrix")
    return(inv)
  }
  mat <- x$get()         # Obtain original matrix
  inv <- solve(mat, ...) 
  x$setInverse(inv)      # Cache the inverse
  inv
}
