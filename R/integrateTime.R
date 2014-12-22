integrateTime <-
    function                            # ^ Integrate a time-series in time
(
    dd # ^ data.frame with Date, Person, ProjectName, ProjectNb, ProjectSubNb, Time
   ,unit = c("day", "week", "month", "year", "total")[2] # ^ time unit to integrate
   ,FUN = sum                           # ^ function for combination
)
{
    unitFun <-
        list(
            day   = function(d) as.character(d)
           ,week  = function(d) as.numeric(format(d, "%V"))
           ,month = function(d) as.numeric(format(d, "%m"))
           ,year  = function(d) as.numeric(format(d, "%Y"))
           ,total = function(d) 'Total'
            )
    ts <- sapply(dd$Date, unitFun[[unit]])
    ddf <- cbind(dd, Unit = ts)
    frml <-
        eval(parse(text =
                       paste("Time ~ Unit + ",
                             paste(names(dd)[-grep("(ProjectName|Time|Date)",
                                                   names(dd))], collapse = " + "))
                   ))
    tt <-
        aggregate(frml, data = ddf, FUN = sum)
    names(tt)[1] = "Date"
    tt
}                             # ^ data.frame with integrated time-unit

