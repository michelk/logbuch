sumSubProjHoursWithoutNmb <-
    function(x,cnf,prjCol)        # sum subproject-hours not specified in cnf
{
    do.call(
        rbind,
        lapply(
            levels(x[,ProjName]), function(l)
            stop('undefined')
            )
}
