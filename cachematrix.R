## creates and stores a matrix and caches its inverse

## creates and stores matrix and its inverse
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL

    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## returns cached inverse of matrix
## if inverse not cached, computes and returns
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()

    if(!is.null(i)) {
        return(i)
    }
    i <- solve(x$get())
    x$setinverse(i)
    i
}
