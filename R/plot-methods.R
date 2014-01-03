setMethod("plot", signature(x = "WorkPeriodWeekTs"),
    function (x, y, ...) 
    {
        plotWorkTs(x@plot_df, what = 'ts'
                 , title_date = 
                       strftime(as.Date(x@from_to[1]) , format = "%B %Y, Week %V")
                , hours = x@hours_to_work
        )
    }
)
setMethod("plot", signature(x = "WorkPeriodWeekPt"),
    function (x, y, ...) 
    {
       plotWorkTs(x@plot_df, what = 'project' 
                , title_date = 
                       strftime(as.Date(x@from_to[1]) , format = "%B %Y, Week %V")
       )
    }
)
setMethod("plot", signature(x = "WorkPeriodMonthTs"),
    function (x, y, ...) 
    {
       plotWorkTs(x@plot_df, what = 'ts' 
                , title_date = 
                       strftime(as.Date(x@from_to[1]) , format = "%B %Y")
                , hours = x@hours_to_work
       )
    }
)

setMethod("plot", signature(x = "WorkPeriodMonthPt"),
    function (x, y, ...) 
    {
       plotWorkTs(x@plot_df, what = 'project' 
                , title_date = 
                       strftime(as.Date(x@from_to[1]) , format = "%B %Y")
       )
    }
)
setMethod("plot", signature(x = "WorkPeriodYearTs"),
    function (x, y, ...) 
    {
       plotWorkTs(plot.df    = x@plot_df
                , what       = 'ts' 
                , title_date = 
                       strftime(as.Date(x@from_to[1]) , format = "%Y")
                , hours      = x@hours_to_work
       )
    }
)

setMethod("plot", signature(x = "WorkPeriodYearPt"),
    function (x, y, ...) 
    {
       plotWorkTs(x@plot_df, what = 'project' 
                , title_date = 
                       strftime(as.Date(x@from_to[1]) , format = "%Y")
       )
    }
)
