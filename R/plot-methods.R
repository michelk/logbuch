plot_functions <- 
  list(
    'week' = 
        list(
            'ts' = function(x, ...) 
                plotWorkTs(x, what = 'ts'
                         , hours = kWeekHoursToWork/kWeekDaysPerWeek
                         , ...
                )
          , 'project' = function(x, ...) 
                plotWorkTs(x , what = 'project', ...)
         )
  , 'month' = 
        list(
            'ts' = function(x, ...) 
                plotWorkTs(x, what = 'ts', 
                           hours = kWeekHoursToWork/kWeekDaysPerWeek, ...)
          , 'project' = function(x, ...) 
                plotWorkTs(x, what = 'project', ...)
        )
 )
setMethod("plot",
    signature(x = "WorkPeriodWeekTs"),
    function (x, y, ...) 
    {
        plotWorkTs(x@plot_df, what = 'ts'
                 , hours = x@hours_to_work
                 , title_date = 
                       strftime(as.Date(x@from_to[1]) , format = "%B %Y, Week %W")
                , hours = x@hours_to_work
                            
        )
    }
)
setMethod("plot",
    signature(x = "WorkPeriodWeekPt"),
    function (x, y, ...) 
    {
       plotWorkTs(x@plot_df, what = 'project' 
                , title_date = 
                       strftime(as.Date(x@from_to[1]) , format = "%B %Y, Week %W")
       )
    }
)
setMethod("plot",
    signature(x = "WorkPeriodMonthTs"),
    function (x, y, ...) 
    {
       plotWorkTs(x@plot_df, what = 'ts' 
                , title_date = 
                       strftime(as.Date(x@from_to[1]) , format = "%B %Y")
                , hours = x@hours_to_work
       )
    }
)

setMethod("plot",
    signature(x = "WorkPeriodMonthPt"),
    function (x, y, ...) 
    {
       plotWorkTs(x@plot_df, what = 'project' 
                , title_date = 
                       strftime(as.Date(x@from_to[1]) , format = "%B %Y")
       )
    }
)
setMethod("plot",
    signature(x = "WorkPeriodYearTs"),
    function (x, y, ...) 
    {
       plotWorkTs(x@plot_df, what = 'ts' 
                , title_date = 
                       strftime(as.Date(x@from_to[1]) , format = "%Y")
                , hours = x@hours_to_work
       )
    }
)

setMethod("plot",
    signature(x = "WorkPeriodYearPt"),
    function (x, y, ...) 
    {
       plotWorkTs(x@plot_df, what = 'project' 
                , title_date = 
                       strftime(as.Date(x@from_to[1]) , format = "%B")
       )
    }
)
