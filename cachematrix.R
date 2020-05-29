## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { 
  
  inv <- NULL # zero out matrix inverse
  #Create the set function for the special vector
  set <- function(y) {
    x <<- y #push matrix y into x in the global enviroment
    inv <<- NULL #reset the global inverse object
  }
  #Create the get function
  get <- function() x
  #Create the set_inverse function
  setInverse <- function(inverse) inv <<- inverse
  #create the get function
  getInverse <- function() inv
  #create the vector made of function calls
  list(set = set, 
       get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)

}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getInverse()
  
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  data <- x$get()
  inv <- solve(data, ...)
  x$setInverse(inv)
  inv
  }

