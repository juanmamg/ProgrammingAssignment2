## Put comments here that give an overall description of what your
## functions do

## the function makeCacheMatrix creates a list of functions that operates on a matrix. The different functions in the list allow to:
## 1- change the matrix over which these functions operates
## 2- get/return the matrix 
## 3- store the inverse of the matrix when given as an input
## 4- return the inverse of the input matrix (when stored)

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
 m<-NULL 
	set<-function(y){
	 x<<-y 
	 m<<-NULL 
	} 
	get<-function() x 
	setinverse<-function(solve) m<<- solve 
	##note, it does not calculates the inverse, it stored a matrix given as input and considered it as the inverse
	## to calculate and store the inverse then the code would be setinverse<-function() m<<- solve(x)
	getinverse<-function() m 
	list(set=set, get=get, setinverse=setinverse, getinverse=getinverse) 
}


## Write a short comment describing this function
## this fucntion check first if the inverse of the matrix has already been calculated and stored, if it has,then it returns the ivnerse.
##if the inverse is not set and stored yet,the the function calculates the ivnerse, store it and returns it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        	m<-x$getinverse() 
	if(!is.null(m)){ 
		message("getting cached data") 
		return(m) 
	} 
	x$setinverse(solve(x$get(),...)) 
	m<-x$get()
	m 
}
