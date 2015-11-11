## cacheMatrix_test.R
##
## code snippet to test functions for assignment #2 in script cacheMatrix.R, in the same repository as this test fie
## NOTE: THIS IS NOT THE SCRIPT FOR ASSIGMENT #2. THAT IS SCRIPT cacheMatrix.R. THIS IS A SCRIPT TO TEST THAT  
##
## Mote: see at end of this example that with a latrge matric, 
## caching saves ~113 seconds:
##
# > timeNoCache
# user  system elapsed 
# 113.31    0.20  113.83 
# > timeYesCache
# user  system elapsed 
# 0.18    0.02    0.19 

source("cachematrix.R")

## create a 4 x 4 square matrix of random normal
## set random number geneator seed to a value that creates an invertible matrix
## set REALLY big matrix so inversion takes a while and we can see benefit of cache
set.seed(1000)
a <- matrix(data = rnorm(16000000,mean = 0,sd = 1),nrow = 4000, ncol = 4000)

## create a makeCacheMatrix() object called myMatrixObj
myMatrixObj<- makeCacheMatrix(a)
myMatrixObj

## use myMatrixObj list of functions to set matrix and get matrix to cnfirm it has been saved
myMatrixObj$setMatrix()
myMatrixDimensions<- dim(myMatrixObj$getMatrix());myMatrixDimensions

## call cacheSolve() BEFORE setting value of inverse and caching it. it will have to calcuate it
myMatrixObj$getInverse() ## returns NaN as we have yet to set inverse
is.matrix(myMatrixObj$getInverse())
timeNoCache<-system.time(cacheSolve(myMatrixObj))
myMatrixObj$getInverse()

## Now call cacheSolve() AFTER setting value of inverse and caching it. Should be faster
timeYesCache<-system.time(cacheSolve(myMatrixObj))

timeNoCache
timeYesCache

# > timeNoCache
# user  system elapsed 
# 113.31    0.20  113.83 
# > timeYesCache
# user  system elapsed 
# 0.18    0.02    0.19 