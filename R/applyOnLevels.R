applyOnLevels <-
    function # ^ apply function on levels of data.frame
(
     x                      # ^ data.frame
    ,levelCol               # ^ column with levels
    ,FUN                    # ^ function to apply to values (eg 'sum')
)
{
    lvs <- levels(factor(x[,levelCol]))
    setNames(lapply(lvs,
           function(l)
           FUN(x[x[levelCol] == l,])
           ),lvs)
}                 # ^ list
