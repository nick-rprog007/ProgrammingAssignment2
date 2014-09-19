## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

	## initialization of inverse matrix (cache)
	inverseMatrixCache <- NULL

	## method: set matrix
	set <- function(srcMatrix) {
		x <<- srcMatrix
		inverseMatrixCache <<- NULL
	}

	## method: get matrix
	get <- function() x

	## method: set inverse matrix to cache
	setInverse <- function(srcInverseMatrix) {
		inverseMatrixCache <<- srcInverseMatrix
	}
	
	## method: get inverse matrix from cache
	getInverse <- function() inverseMatrixCache

	## makeCacheMatrix() - return list of properties and methods
	list(set = set, get = get,
		setInverse = setInverse,
		getInverse = getInverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {

	##get inverse matrix from cache
	inverseMatrix <- x$getInverse()
	
	if( !is.null(inverseMatrix) ) {
		## if cache not empty - return inverse matrix from cache
		message("getting cached data")
		return(inverseMatrix)
	}

	## calculate our task
	inverseMatrix <- solve(x$get(), ... )

	## and set our result to cache
	x$setInverse(inverseMatrix)

	## return calculated value
	inverseMatrix
}


## Sorry for my english, its not my native language :)