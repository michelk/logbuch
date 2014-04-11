procProjectHours <-
    function(x)                         # process project-hours
{
    projs <- levels(factor(x$ProjectNb))
    setNames(
        lapply(
            projs, function(pn)
        {
            p <-                                # project-data
                subset(x, ProjectNb == pn)
            do.call(
                rbind
                , lapply(                             # hours subproject per worker
                         levels(factor(p$ProjectSubNb)), function(spn)
                     {
                         sp <-
                             subset(p, ProjectSubNb == spn)
                         wh <-                    # hours per worker
                             sapply(
                                 levels(sp$Person), function(wn)
                                 sum((subset(sp, Person == wn)$Time)))
                         data.frame(t(wh), row.names = spn)
                     }
                         )
                )
        }), projs)
}
