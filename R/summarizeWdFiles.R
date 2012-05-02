summarizeWdFiles <- 
    function       # summarize workdays
(
    xs             # vector with workday-files
)
{
    # ToDo: validity check to find log_files
    workdays.list <- # list with workdays
        Workdays(wd = 
                 lapply(xs, 
                        function(x){ 
                            readDayFile(x)
                        }
                   )
       )

    # Generate a data-frame
    as.data.frame(workdays.list)
    ### Returns a data-frame with summed workhours per project and day
}
