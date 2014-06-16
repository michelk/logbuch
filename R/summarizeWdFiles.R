summarizeWdFiles <-
    function                            # ^ summarize workdays
(
    xs                                  # ^ vector with workday-files
)
{
    # ToDo: validity check to find log_files (eg duplicated files)
    lst. <-                            # list with workdays
        Workdays(wd = lapply(xs, function(x) readDayFile(x)))

    lst <-                              # exclude NULL
        new(class(lst.), lst., wd = lst.@wd[!sapply(lst.@wd, is.null)])

    # Generate a data-frame
    as.data.frame(lst)
}   # ^ Returns a data-frame with summed workhours per project and day
