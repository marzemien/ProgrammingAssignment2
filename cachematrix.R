## Dear grader. I've put the course's instructions in parentheses. It's very likely that
## you're alread familiar with them.
##( Put comments here that give an overall description of what your
## functions do)

# The function makeCacheMatrix() and cacheSolve() are used to create, store, and find the inverse 
# of a matrix. The cache can prevent time-consuming repeate calculations by finding a previous 
# stored input matrix and producing the result rather than running the calculation. 
# Importantly, for this solution for the assignment, makeCacheMatrix() must be assigned to an object.
# and given an argument that is a matirx. That object is what is then passed to makeCacheMatrix().
# So, for example 
 cachematrix1 <- makeCacheMatrix(matrix(1:4, nrow = 2, ncol = 2))
 cacheSolve(matrix1)
# cacheSolve will work if, in this example, the first time matrix1 is passed it produces an output
# of the inverstion. Subsequent times, the R Console will display the message "getting cached data"
# then output the stored inverse, rather than running the calculation again. 
# Only square matricies (lenght = width) are invertable. 

## (Write a short comment describing this function.)

# makeCacheMatrix() takes a matrix as an argument. This funciton should be assigned to 
# object. Note that subsequenlty calling that object will output a list. 

makeCacheMatrix <- function(x = matirx()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## (Write a short comment describing this function)

# Cache solve takes an the object that makeCacheMatrix() has been assigned and returns its
# 3inverse by using R's solve() function. 
# Note that a square matrix without a determinent of 
# 0 won't be invertable. I don't understand the math, just know that certain square matricies
# when passed through solve() will produce an error. like matrix(1:9, nrow = 3, ncol = 3)

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
