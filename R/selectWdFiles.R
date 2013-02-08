selectWdFiles <-
  function                              # ^ Select wdlog-files lying in certain range
(
  fs                                    # wdlog-files
 ,from                                  # starting date-object
 ,to                                    # ending date-object
)
{
  f <- function(x)
    {
      s <- strsplit(x, "/")[[1]]
      d <- as.POSIXct(strsplit(s[length(s)], "\\.")[[1]][1])
      d > from && d < to
    }
  Filter(f,fs)
}
