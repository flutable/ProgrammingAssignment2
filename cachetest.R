makeVector <- function(x = numeric()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setmean <- function(mean) m <<- mean
    getmean <- function() m
    list(set = set, get = get,
         setmean = setmean,
         getmean = getmean)
}

cachemean <- function(x, ...) {
    m <- x$getmean()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- mean(data, ...)
    x$setmean(m)
    m
}

# vec <- makeVector(1:10)
# >vec #just returns the list of 4 elements
# > cachemean(vec)
# [1] 5.5
# > vec$setmean(2)       #accessing object directly, bad form!
# > vec$getmean()
# [1] 2
# > cachemean(vec)       #2nd call gets cached data
# getting cached data
# [1] 2