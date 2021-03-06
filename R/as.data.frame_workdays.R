setMethod("as.data.frame",
    signature(x = "Workdays"),
    function #^ Function to convert a workdays_list object into a dataframe
          (
              x # ^ object of class workdays_list
            , row.names = NULL, optional = FALSE, ...)
    {
        projects <- unique(unlist(sapply(x@wd, function(x) x@topic)))
        dates <- sapply(x@wd, function(x) as.character(x@date))
        value_df <- data.frame(matrix(0,
                                      ncol = length(projects),
                                      nrow = length(dates),
                                      dimnames = list(dates, projects)))
        for ( i in seq(along = x@wd) ) {
            for ( j in seq(along = x@wd[[i]]@topic) ) {
                value_df[i, x@wd[[i]]@topic[j]] <-
                    round(x@wd[[i]]@hours[j], digits = 2)
            }
        }
        return(value_df)
    } # ^ Returns a data frame of a workdays_list
)

