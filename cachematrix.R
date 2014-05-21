#############################################################################
# Module: cachematrix.R
# Author: Alex mPittendreigh
#   Date: 21 May 2014
#  Notes: This module of related functions will create a Matrix and also 
#       : return the inverted matrix using a caching system
#############################################################################

#############################################################################
#  Function: makeCacheMatrix
# Arguments: x - being the matrix that will be converted to an inverse matrix
#                with embedded functions to get and set the value
#############################################################################
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL                            # initialise the cache variable
  
  # inner function that will allow a new matrix object to be set
  set <- function(y) {
    x <<- y                            # sets the new value to object
    m <<- NULL                         # resets the cache variable
  }
  
  # inner function that returns the value of the object
  get <- function() {
    x
  }
  
  # inner function that will set the inverse of the matrix into the 
  # cache variable
  setinverse <- function(inverse) {
    m <<- inverse
  }
  
  # inner function that will returned the cached inversed matrix
  getinverse <- function() {
    m
  }
  
  # return the new object back as a list
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


#############################################################################
#  Function: cacheSolve
# Arguments: x - being the matrix that will be converted to an inverse matrix
#                and cached
#          : ... - other parameters as requiresd
#############################################################################
cacheSolve <- function(x, ...) {
  # get the value of the cached inversed matrix variable
  m <- x$getinverse()
  
  # If the variable is not null, it means it has been cached so return that
  # instead of calculating a new inversed matrix
  if (!is.null(m)) {
    message("Here is the cached version of the inversed matrix")
    return(m)
  } else {                             # We have some work to do to do
    data <- x$get()                    # get the value of the original matrix
    m <- x                             # need to change this line to invert
    x$setinverse(m)                    # sets the cache var with the inverse
    return(m)                          # and returns it.
  }
  
  
}
