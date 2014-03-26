subsetLevels <-
    function
(
    x                                   # ^ data.frame
   ,levelCol                            # ^ column with levels
)
{
    lapply(
        levels(factor(x[,levelCol])), function(l)
        subset(x, x[,levelCol] == l)
        )
    stop('undefined')
}
