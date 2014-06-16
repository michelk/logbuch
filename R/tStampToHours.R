tStampToHours <-
    function                        # ^ convert time stamps to durations
(
    x                                   # ^ data.frame 10.00 -12.00 in first row
)
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
}                                       # ^ data.frame with durations
