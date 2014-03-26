tStampToHours <-           # convert time stamps to durations
    function(x)
{
    hoursSE <-                          # hours start-end-points
        strsplit(as.vector(x), split = "-")
    sapply(hoursSE,
           function(y){
               h <-
                   as.POSIXct(y, format = "%H.%M")
               as.numeric(difftime(h[2],  h[1], units = "hours"))
           }
           )
}
