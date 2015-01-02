subsetAndIntegrate <-
    function                            # ^ Subset and integrate dataset
(
    dd                                  # ^ data.frame
   ,prs     = na                        # ^ character: Person
   ,prj     = na                        # ^ character: ProjectNb
   ,from    =                           # ^ date: from
       as.character(min(dd$Date))
   ,to      =                           # ^ date: to
       as.character(max(dd$Date))
   ,unit    =                           # ^ time unit to integrate
       c("day", "week", "month", "year", "total")[2]
   ,details = FALSE                     # ^ logical: subproject detail
   ,na      = "Keine Wahl"              # ^ Mark no-data-values
)
{
    di <-
        dd$Date > as.POSIXct(from) & (dd$Date < as.POSIXct(to))
    dd <-                           # filter time
        dd[di,]
    if (!identical(prj, na))        # filter project
        dd <- subset(dd, ProjectNb == prj)
    if (!identical(prs, na))        # filter person
        dd <- subset(dd, Person == prs)
    if (!details)
        dd <-
            aggregate(
                Time ~ Date + Person + ProjectNb,
                data = dd, FUN = sum)
    if (!identical(unit, na))
        dd <-
            integrateTime(dd, unit)
    dd[order(dd$Date),]
}                                       # ^ data.frame
