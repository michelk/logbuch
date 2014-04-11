yearWorkHours <-
    function(year, hours, sumHours = TRUE)
{
    aStart <- as.POSIXct(sprintf("%s-01-01", year))
    aEnd <- as.POSIXct(sprintf("%s-12-31", year))
    days_of_year <- seq(aStart, aEnd, by = (3600 * 24))
    workdays_of_year <- days_of_year[!sapply(days_of_year, isWeekend)]
    dd <-
        t(sapply(workdays_of_year, function(d)
                 c(format(d,"%F"), format(d, "%m"), hours)))
    ddf <-
        data.frame(MonthNumber = dd[,2]
                  ,Hours = as.numeric(dd[,3]), row.names = dd[,1])
    ddm <-
            t(sapply(levels(ddf$MonthNumber),
                 function(n)
                 sum(subset(ddf, MonthNumber == n)$Hours)
                 )
          )
    ddmf <- data.frame(Sollstunden = ddm[1,], row.names = colnames(ddm))
    if (sumHours)
        rbind(ddmf, Total = sum(ddm))
    else
        ddmf
}
