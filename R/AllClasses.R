setClass("workday", representation(topic = "character", hours = "numeric", 
                                   date = "POSIXct"))
setClass("workdays", representation(wd = "list", week = "numeric"))
workdays <- function(wd, week){
    library("methods")
    value <- 
        new("workdays", 
            wd = wd,
            week = week)
    return(value)
}
setClass("workweek", representation(topics = "character", hours = "numeric", 
                                    week = "numeric"))
