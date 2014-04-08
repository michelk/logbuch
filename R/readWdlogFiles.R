readWdlogFiles <-
    function
(
    fs
)
{

    fpToDate <- function(f) as.POSIXct(sub( "\\.wdlog$", "", basename(f)))
    dateToFp <- function(d) paste(as.character(d), "wdlog", sep = ".")

    bfs <- basename(fs)

    dts <-                                  # all days in date-range
        seq(fpToDate(fs[1]), fpToDate(fs[length(fs)]), by = "day")
    dd. <-
        do.call(
            rbind,
            lapply(
                dts, function(d)
            {
                dd. <-
                {
                    if (dateToFp(d) %in% bfs)
                        readDayFile( # could also emmit NULL, if parsing fails
                                    fs[which(bfs == d)], subProj = TRUE)
                    else
                        NULL
                }
                dd <-
                {
                    if (is.null(dd.))
                        data.frame(Proj = NA, SubProj = NA, Time = NA, Desc = NA)
                    else
                        dd.
                }
                cbind(
                    data.frame(
                        Year = format(d, "%Y"),
                        Month = months.abbr.de[[as.numeric(format(d, "%m"))]],
                        Day = format(d, "%d")
                        ), dd)
            }
                ))
    dcast(dd., Year + Month + Proj + SubProj ~ Day, value.var = "Time")
}
