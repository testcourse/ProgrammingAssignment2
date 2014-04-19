## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function will create a special R object that store a matrix and cache its inversion 

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y){
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setsolve <- function(solve) m <<- solve
	getsolve <- function() m
	list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)

}


## Write a short comment describing this function

## This function can return the inversion. If the inversion is calculated previously, this function will return the cached inversion rather than calculate it again 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		m <- x$getsolve()
		if(!is.null(m)){
			message("getting cached data")
			return(m)
		}
		data <- x$get()
		m <- solve(data, ...)
		x$setsolve(m)
		m
}
