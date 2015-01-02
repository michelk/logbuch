readWdlogCsv <-
    function                            # ^ Read wdlog-data in csv-format
(
    f                                   # ^ filepath to csv-file
   ,NBM = 31                            # ^ number of days per month
)
{
    dd. <-
        read.table(f, sep = ";", stringsAsFactors = FALSE)[,1:(NBM+6)]
    dd <-
        wideToLongData(dd.)
    transform(dd,
              ProjectNb = factor(as.character(ProjectNb))
             ,ProjectSubNb = factor(as.character(ProjectSubNb))
              )
}                                       # ^ data.frame
