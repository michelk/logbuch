sumSubProjHoursWithoutNmb <-
    function               # Sum subproject-hours not specified in cnf
(
    x
   ,cnf
)
{
    sumSubPrj <-
        function(d,l, cnf)
        {
            n <- 7                      # column hour-data starting
            m <- ncol(d)                # column hour-data ending
            ids <- sapply(cnf, function(e) e@id)
            nme <- names(ids)[which(ids == l)]
            hrs <- colSums(d[,n:m], na.rm = TRUE)
            hrs[hrs == 0] <- NA
            dd. <-
                cbind(d[1,1:3], ProjName = nme, d[1,5:(n -1)],
                      as.data.frame(matrix(hrs, nrow = 1)))
            names(dd.)[n:m] <- names(hrs)
            dd.
        }
    do.call(
        rbind,
        lapply(
            levels(factor(x[,"Month"])), function(mn)
        {
            e <- subset(x, Month == mn)
            do.call(
                rbind,
                lapply(
                    levels(factor(e[,"ProjNb"])), function(l)
                {
                    dd <-
                        subset(e, ProjNb == l)
                    i.na <- is.na(dd$SubProjNb)
                    rbind(
                        dd[!i.na,]              # subprojects defined
                        ,sumSubPrj(dd[i.na,], l,cnf)
                        )
                }
                    )
                )
        }
            )
        )
}
