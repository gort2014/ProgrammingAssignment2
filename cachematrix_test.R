## cacheMatrix_test.R
##
## code snippet to test functions for assignment #2 in script cacheMatrix.R, in the same repository as this test fie
## NOTE: THIS IS NOT THE SCRIPT FOR ASSIGMENT #2. THAT IS SCRIPT cacheMatrix.R. THIS IS A SCRIPT TO TEST THAT  

## create a 4 x 4 square matrix of random normal
## set random number geneator seed to a value that creates an invertible matrix
set.seed(1000)
a <- matrix(data = rnorm(16,mean = 0,sd = 1),nrow = 4, ncol = 4)

## create a makeCacheMatrix() object called myMatrixObj
myMatrixObj<- makeCacheMatrix(a); 


## use myMatrixObj list of functions to set matrix and get matrix to cnfirm it has been saved
myMatrixObj$setMatrix(a)
myMatrixObj$getMatrix()

## call cacheSolve() BEFORE setting value of inverse and caching it. it will have to calcuate it
getMyInverse<-cacheSolve(myMatrixObj)
myMatrixObj$getInverse()

## call cacheSolve() AFTER setting value of inverse and caching it. it will have to calcuate it
getMyInverse<-cacheSolve(myMatrixObj);getMyInverse
