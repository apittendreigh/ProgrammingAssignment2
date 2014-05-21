#############################################################################
# Module: cachematrix.R
# Author: Alex mPittendreigh
#   Date: 21 May 2014
#  Notes: This module of related functions will create a Matrix and also 
#       : return the mean of the inverted matrix using a caching system
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
  
  # inner function that will set the mean into the cache variable
  setmean <- function(mean) {
    m <<- mean
  }
  
  # inner function that will returned the cached mean values value
  getmean <- function() {
    m
  }
  
  # return the new object back as a list
  list(set = set, get = get, setmean = setmean, getmean = getmean)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
