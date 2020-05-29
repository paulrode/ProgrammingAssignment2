## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { 
  
  inverse <- NULL # zero out matrix inverse
  #Create the set function for the special vector
  set <- function(y) {
    x <<- y #push matrix y into x in the global enviroment
    inverse <<- NULL #reset the global inverse object
  }
  #Create the get function
  get <- function() x
  #Create the set_inverse function
  setInverse <- function(solve) inverse <<- solve
  #create the get function
  getInverse <- function() inverse
  #create the vector made of function calls
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getInverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- x$get()
  inverse <- solve(data, ...)
  x$setInverse(inverse)
  inverse
  }
cacheSolve(c(1,2,3,4))






