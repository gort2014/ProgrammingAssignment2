
## For programming assignment #2
## This script contains two functions designed to build and use an R 'object' of sorts to deal with matrix inversion. 
# The 'object' is an R list that contains R functions as elements of the list. These functions allow the user to set 
## and get values of a matrix and to calculate the inverse of the matrix. Since inversion of a matrix can be time 
## consuming for large matrices, the functions cache the value of the inverse a and provide another function to 
## simply get the cached value if the inverse already has been calclated.
##
## The funtion makes sure to clear the value of the inverse whenever a new matrix is assigned so that a stored value 
## of the inverse is always consistent with the stored value of the matrix.
##
## A short snippet of code to test these functions is stored in the same repository as this script, called cacheMatrix_test.R


## The function below, `makeCacheMatrix`, creates a "matrix" object of sorts. This object is an R list that 
## contains functions to do the folwing
##
## 1.  set and save (i.e. cache) the value of a matrix (assumes the matrix is square and invertible for this assignment)
## 2.  retrieve the matrix
## 3.  calculate and save (i.e. cache) the value of the inverse of the matrix
## 4.  retrieve the value of the inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
        
        ## initialize value of inverse        
        myInverse <<- NaN

        setMatrix<- function(myMatrix){
        ## Set value of matrix passed by user AND initialize inverse as NaN
        ## by initializing value of inverse as NaN will ensure there is never a disconnect between a new matrix and an inverse from a 
        ## previous matrix
                myMatrix <<- x
                myInverse <<- NaN
        }                
                
        getMatrix <- function() myMatrix ## function to return value of matrix chached by user
        
        setInverse <- function(y = matrix()) {
        ## set value of inverse passed by user        
                myInverse <<- y
        }
        
        getInverse <- function() myInverse ## function to return value of inverse cached by user
        
        ## this will set the functions above as elements of an R list returned to function call
        list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse, getInverse = getInverse)
        
        }


## The function cacheSolve() expects its argument to be a makeCacheMatrix() R 'list' object
## the function will check the makeCacheMatrix() list functions for cached values
## if cached values exits, it will use those
## if cached values do not exist, this function will calculate and set them
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of matrix stored in list x as x$getMatrix
        ## for this assignment, assume x$getMatrix has a valid value (square and invertible) WITHOUT CHECKING
        
        matrixInverse <- x$getInverse()
        
        if(!is.nan(matrixInverse)) {
                message("getting inverse from cache")
                return(matrixInverse)
        } else {
                message("inverse not cached. CCalculating inverse")
                matrixInverse<- solve(x$getMatrix())
                x$setInverse(matrixInverse)
                matrixInverse
        }
}


