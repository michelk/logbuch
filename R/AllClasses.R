setClass("Workday", 
         representation(topic = "character"
                      , hours = "numeric"
                      , date = "POSIXct"
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
    new("Workdays", 
        wd = wd,
        )
}
setClass("Workweek", 
         representation(topics = "character"
                      , hours = "numeric"
                      , week = "numeric"
         )
)
