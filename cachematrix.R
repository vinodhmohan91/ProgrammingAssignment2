## R script to demonstarte the caching functionality

## Below function is used to create a special matrix object (which is a list)
## Returns list of 4 functions -> set, get matrix; set,get matrix inverse

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
     setMatrix <- function(y){
          x <<- y
          inv <<- NULL
     }
     getMatrix <- function() x
     setInverse <- function(inverse) inv <<- inverse
     getInverse <- function() inv
     list(setMatrix = setMatrix, getMatrix = getMatrix,
          setInverse = setInverse, getInverse = getInverse)
}

## Below function is used to compute the inverse of a matrix
## Retrieve the inverse value from cache if available otherwise set in cache

cacheSolve <- function(x, ...) {
    inv <- x$getInverse()
     if(!is.null(inv)){
         print("Fetching cached data")
          return(inv) 
     }
     data <- x$getMatrix()
     inv <- solve(data, ...)
     x$setInverse(inv)
     inv ## Returns a matrix that is the inverse of 'x'
}
