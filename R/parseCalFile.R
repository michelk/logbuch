parseCalFile <-
    function
(
    file
   ,year
   ,monthSep = '/'
   ,rangeSep = '-'
)
{
    parseDate <-
        function(d, year)
        {
            isweek <- function(x) length(grep(monthSep, x)) == 0
            isrange <- function(x) ! length(grep(rangeSep, x)) == 0
            parseWeek <- function(x) {}
            parseRange <-
                function(x)
                {
                    dd <- as.numeric(strsplit(x, rangeSep)[[1]])
                    seq(dd[1], dd[2])
                }
            parseDays <-
                function(x, year)
                {
                    dm <- strsplit(x, monthSep)[[1]]
                    month <- dm[2]
                    daysR <- dm[1]
                    days <-
                    {
                        if (isrange(daysR))
                            parseRange(daysR)
                        else
                            daysR
                    }
                    as.POSIXct(paste(year, month, days, sep = "-"))
                }
            parseWeeks <-
                function(x, year)
                {
                    n <- 1:5
                    days <-
                    {
                        if (isrange(x))
                        {
                            r <- parseRange(x)
                            as.character(outer(r, n, paste))
                        }
                        else
                            paste(x, n)
                    }
                    as.POSIXct(paste(year,days), format = "%Y %V %w")
                }
            days <-
            {
                if (isweek(d))
                    parseWeeks(d[1], year) # returns a list of days
                else
                    parseDays(d[1], year)      # returns a list of days
            }
            data.frame(Date = days, Categorie = d[2], Subject = d[3])
        }
    ddIn <- read.table(file, stringsAsFactors = FALSE)
    do.call(
        rbind
        ,lapply(
            seq_len(nrow(ddIn))
            ,function(i) parseDate(as.character(ddIn[i,]), year)))
}
