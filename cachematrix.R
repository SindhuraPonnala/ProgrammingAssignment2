## The following functions use the concept of lexical scoping in R 


## The below function creates a matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
}
get<-function() x
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)
}

## Computes a matrix inverse or if it the inverse of the matrix 
##has already been calculated it retrieves it from the cache

cacheSolve <- function(x=matrix(), ...) {
    m<-x$getmatrix()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
    matrix <-x$get()
    m<-solve(matrix, ...)
    x$setmatrix(m)
    m
}
