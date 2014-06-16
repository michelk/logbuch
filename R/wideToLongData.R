wideToLongData <-
    function                   # ^ convert from long-format to wide
(
    x                                   # data.frame
)
{

    NBM <- 31                           # Number of days per month
    AMNT <- months.nb.de
    dd <-
        do.call(
            rbind,
            lapply(
                seq_len(nrow(x)), function(j)
            {
                r <- x[j,]
                do.call(
                    rbind,
                    lapply(
                        seq_len(NBM)[as.logical(!is.na(r[,seq_len(NBM)+6]))],
                        function(i)
                    {
                        dte <-                          # date
                            as.POSIXct(
                                sprintf("%i-%i-%i",
                                        as.numeric(r[,2]), AMNT[[r[,3]]], i))
                        data.frame(Date = dte, Person = r[,1], ProjectName = r[,4],
                                   ProjectNb = r[,5], ProjectSubNb = r[,6],
                                   Time = as.numeric(r[,6+i]))
                    }
                        ))
            }
                )
            )
    dd[order(dd$Date),]
}                                       # ^ reshaped data.frame
