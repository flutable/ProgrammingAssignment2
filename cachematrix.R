## These functions speed up retrieving the inverse of a matrix by:
## 1. calculating the inverse of the matrix once and storing the inverse
## 2. supplying the inverse on demand instead of re-calculating it.

## The inverse is only calculated when a new matrix is passed as an argument.
## Note: These functions assume the matrix is invertable.

## To use the functions:
##  1. Pass an invertable matrix to makeCacheMatrix as follows:
##     mat1 <- makeCacheMatrix(mat)
##     where 'mat' is a matrix (eg: mat <- matrix(c10:13),2,2)
##           'mat1' is a matrix variable.

makeCacheMatrix <- function(x = matrix()) {
    matInv <- NULL               
    set <- function(y) {
        x <<- y
        matInv <<- NULL
    }
    get <- function() x 
    setmatInv <- function(solve) {matInv <<- solve}
    getmatInv <- function() {matInv}
    list(set = set, get = get,
         setmatInv = setmatInv,
         getmatInv = getmatInv)
}


## 2. To find the inverse of the matrix, call cacheSolve as follows:
##    cacheSolve(mat1)
##         or
##    mat1Inv <- cacheSolve(mat1)
##    The next time you call cacheSolve you will see a message stating that the cached
##    value of the inverse is being retrieved.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    matInv <- x$getmatInv()
    if(!is.null(matInv)) {
        message("getting cached data")
        return(matInv)
    }
    data <- x$get()
    matInv <- solve(data, ...)
    x$setmatInv(matInv)
    m
}



