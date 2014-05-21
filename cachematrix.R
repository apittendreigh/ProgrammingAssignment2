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
#          : ... - other parameters as required
#   Returns: the inverted matrix 
#     Notes: calculates the inverted matrix and then stores the inversion in
#            a cahce varibale. This allows a second and subsequent calls to
#            return the cached version instead of performing the potentially
#            time consuming calculation again.
#############################################################################
cacheSolve <- function(x, ...) {
  # get the value of the cached inversed matrix variable
  m <- x$getinverse()
  
  # If the variable is not null, it means it has been cached so return that
  # instead of calculating a new inversed matrix
  if (!is.null(m)) {
    message("returning the cached version of the inversed matrix")
    return(m)
  } else {                             # We have some work to do to do
    data <- x$get()                    # get the value of the original matrix
    m <- solve(data)                   # call func to calc inverted matrix ## CHANGE THIS LINE
    x$setinverse(m)                    # caches the inverted matrix
    return(m)                          # and returns it.
  }
}