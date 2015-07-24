## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# makeCacheMatrix <- function(x = matrix()) {
#
# }

# Note the use of the <<- operator below.
# For more information about this operator, go to RStudio and type
#    help ("<<-")
# on the command line.
#
# When I did that I got this (in the help window):
#
# The operators <<- and ->> are normally only used in functions, and cause a
# search to made through parent environments for an existing definition of the
# variable being assigned. If such a variable is found (and its binding is not
# locked) then its value is redefined, otherwise assignment takes place in the
# global environment.
#
# Basically this is the key to the entire assignment. Using this operator puts
# the value into "cache" (meaning, into some enviromnent that I guess is some
# kind of parent, or something).
#
# I don't fully understand this myself - I tried this on a guess and it seems to work.
#
# Regarding the functionality - this is basically a set of utilities to
#   initialize,
#   cache, fetch from cache,
#   cache inverse, fetch inverse from cache.

makeCacheMatrix <- function(x = matrix()) {
  iCache <- NULL # used to store the inverse - it's null to begin with

  cacheMatrix <- function(inMatrix) {
    x <<- inMatrix
    iCache <<- NULL
  }

  fetchMatrix <- function() {
    x
  }

  cacheInv <- function(solve) { # Kludgey - could generalize this, don't care.
    iCache <<- solve
  }

  getInv <- function() {
    iCache
  }


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

# This function uses the R solve function to invert (see assignment)
# No checking for non-invertible matrix (see assignment)
cacheSolve <- function(y, ...) {
   # If it exists, get it
   inverse <- y$getInv()
   if(!is.null(inverse)) {
      # message("Here at 1: getting cached matrix")
      return(inverse)
   }
   # else
   z <- y$fetchMatrix() # set it
   inverse <- solve(z)  # invert it
   y$cacheInv(inverse)  # cache it for next time
   inverse              # return it
}
