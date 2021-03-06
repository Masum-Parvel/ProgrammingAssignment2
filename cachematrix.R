## The following "makeCacheMatrix" function creats a special matrix that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
               inverse<- NULL
               set<- function(y){
                    x<<- y
                    inverse<<- NULL
                 }
               get<- function() {
                     x
                 }
               setInverse<- function(inverse1) {
                          inverse<<- inverse1  
                 }
               getInverse<- function() {
                          inverse
                 }
               list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

}


## And the following "cacheSolve" function computes the inverse of the special matrix created above. 
## If the inverse has already calculated before then this function retrieves the inverse from the cache. 

cacheSolve <- function(x, ...) {
             inverse<- x$getInverse
             if(!is.null(inverse)) {
               message("Geting Cached Matrix")
               return(inverse)
             }
             matrix<- x$get()
             inverse<- solve(matrix, ...)
             x$setInverse(inverse)
             inverse
             
}
