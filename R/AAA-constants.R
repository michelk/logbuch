kSummryFileName <-  "Summary.txt"
kTotalFileName <- "Total.txt"
kTsFileName <- "TS.txt"
kTsPdfName <- "TS.pdf"
kProjPdfName <- "Projects.pdf"
kWeekHoursToWork <- 33.6
kWeekDaysPerWeek <- 5

months.abbr.de <-
    setNames(c("Jan", "Feb", "Mrz", "Apr", "Mai", "Jun",
               "Jul", "Aug", "Sep", "Okt", "Nov", "Dez"), seq_len(12))

months.nb.de <-                     # Month (abbr) - Number Assoc-list
    setNames(seq_len(12),
             c("Jan", "Feb", "Mrz", "Apr", "Mai", "Jun",
               "Jul", "Aug", "Sep", "Okt", "Nov", "Dez"))
