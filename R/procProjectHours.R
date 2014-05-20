procProjectHours <-
    function(x)                         # process project-hours
{
    projs <- levels(factor(x$ProjectNb))
    setNames(
        lapply(
            projs, function(pn)
        {
            p <-                        # project-data
                subset(x, ProjectNb == pn)
            dd <-
                do.call(
                    rbind
                  , lapply(               # hours subproject per worker
                      levels(factor(p$ProjectSubNb)), function(spn)
                      {
                          sp <-
                              subset(p, ProjectSubNb == spn)
                          wh <-          # hours per worker
                              sapply(
                                  levels(sp$Person), function(wn)
                                      sum((subset(sp, Person == wn)$Time)))
                          data.frame(t(wh), row.names = spn)
                      }
                  )
                )
            if (is.null(dd))
                NULL
           else
           {
               i <-                        # skip columns all being 0
                   as.logical(apply(dd, 2, function(r) all(sapply(r, function(x) x != 0))))
               subset(dd, select  = i)
           }
        }), projs)
}
