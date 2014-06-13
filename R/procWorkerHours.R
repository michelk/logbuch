procWorkerHours <-
    function(x)
{
    if (length(which(is.na(x$Person))) > 0)
        x[is.na(x$Person), 'Person'] <-   'Unkown' # deal with Person == NA
    pers <- levels(factor(x$Person))
    setNames(lapply(
        pers, function(wn)
    {
        w. <-                                # worker-data
            subset(x, Person == wn)
        w <-
            cbind(w., Month = factor(format(w.$Date, "%m")))
        do.call(
            rbind
            ,lapply(
                levels(w$Month), function(mn)
            {
                m <-
                    subset(w, Month == mn)
                lvs <- levels(factor(w$ProjectNb))
                ph <-                       # hours per project
                    sapply(
                        lvs[order(as.numeric(lvs))], function(pn)
                        sum(subset(m, ProjectNb == pn)$Time)
                        )
                data.frame(t(ph), row.names = mn)
            }
                )
            )
    }
        ), pers)
}
