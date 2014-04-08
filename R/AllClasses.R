setClass(
    'ProjConf',
    representation(
        name = "character"    # ^ name of project
       ,id   = "character"    # ^ id
       ,sb   = "list"     # ^ named list with name and number
        )
    )
setClass(
    "ProjectDay",
    representation(
        name = "character"    # ^ name of the project
       ,date = "POSIXct"      # ^ day worked on the project
       ,hours = "list"        # ^ named list with hours per subproject
        )
    )
setClass("Workday",
         representation(
             topic   = "character"
            ,hours   = "numeric"
            ,date    = "POSIXct"
            ,subject = "character"
         )
)
setClass("Workdays",
         representation(wd = "list")
)

Workdays <-
    function
(
    wd             # list with workdays
)
{
    library("methods")
    new("Workdays", wd = wd)
}

setClass("Workweek",
         representation(
              topics = "character"
             ,hours  = "numeric"
             ,week   = "numeric"
         )
)
setClass('WorkPeriod',
         representation(
                from_to = "character"  # time-period from to (length 2)
              , plot_df = "data.frame" # vector with dates (week, month, year)
              , hours_to_work = "numeric" # hours to work per time-unit
        )
)
setClass('WorkPeriodWeekTs'
       , contains = 'WorkPeriod'
)
setClass('WorkPeriodWeekPt'
       , contains = 'WorkPeriod'
)
setClass('WorkPeriodMonthTs'
       , contains = 'WorkPeriod'
)
setClass('WorkPeriodMonthPt'
       , contains = 'WorkPeriod'
)
setClass('WorkPeriodYearTs'
       , contains = 'WorkPeriod'
)
setClass('WorkPeriodYearPt'
       , contains = 'WorkPeriod'
)
