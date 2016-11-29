readWdlogFiles <-
    function                            # ^ Read a series of `.wdlog`-files
(
  fs                               # ^ 'character': file-paths to `.wdlog`-files
 ,wide =                           # ^ 'logical': wide output format
   TRUE

)
{
  require('reshape2', quietly = TRUE)
  fpToDate <- function(f) as.POSIXct(sub( "\\.wdlog$", "", basename(f)), tz = "UTC")
  dateToFp <- function(d) paste(as.character(d), "wdlog", sep = ".")

  bfs <- basename(fs)

  dts <-                                  # all days in date-range
    as.POSIXct(format(
      seq(fpToDate(fs[1]), fpToDate(fs[length(fs)]), by = "day")
     ,"%Y-%m-%d"))
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
                  fs[which(bfs == dateToFp(d))], subProj = TRUE)
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
              Date = d,
              Year = as.numeric(format(d, "%Y")),
              Month = months.abbr.de[[as.numeric(format(d, "%m"))]],
              Day = format(d, "%d")
            ), dd)
        }
      ))
  if (wide)
    dcast(dd., Year + Month + Proj + SubProj ~ Day, value.var = "Time")
  else
    dd.
}                             # ^ Data frame with hours worked per day
