readDayFile <-
    function # ^Reads in a day record and returns and object of class "Workday"
(
    x # ^ character; day record -file with log ending; consisting of :
)        #  Date : Monday, 18 October 2011
         #  08.00 - 10.00  |   <Project>   | <subproject>  | Description
         #  10.00 - 12.00  |   <Project>   | <subproject2> | Description
{
    readHours <-
        function                        # ^ parse hours sep could '.' or ':'
    (
        h
    )
    {
        stop("undefined")              # TODO
    }                                  # ^ list with hours and minutes
    day <- sub(".wdlog", "", basename(x))
    day_hours_df. <-
        read.table(x, sep = "|", skip = 1, stringsAsFactors = FALSE)
    day_hours_df <-         # remove any whitespace/tab except of desc
        cbind(
            t(apply(day_hours_df.[,1:3], 1, cleanWdLogField)),
            day_hours_df.[,4]
            )
    hoursSE <-                          # hours start-end-points
        strsplit(as.vector(day_hours_df[,1]), split = "-")
    hours <-
        sapply(hoursSE,
               function(y){
                   h <- as.POSIXct(paste(day, y),
                                   format = "%Y-%m-%d %H.%M")
                   d <- as.numeric(difftime(h[2],  h[1], units = "hours"))
               }
    )
    day_df <- data.frame(projects = as.vector(day_hours_df[,2]), workhours =  hours)
    projects <- levels(day_df$projects)
    if ( length(projects) == 1 )  {
        # Workaround for not displaying projects names right, when only worked
        # on one project per day
        value_df <- data.frame(sum(day_df[,2]))
        names(value_df) <- day_df[1,1]
        subjects <- paste(unique(as.character(day_hours_df[,3])), collapse = ".")
    } else {
        index <-
            lapply(projects,
                   function(x){
                       index <- which(day_df[,1] == x)
                   })
        subjects <-
          sapply(
              seq_along(projects), function(i)
                paste(unique(as.character(day_hours_df[index[[i]],3])), collapse = ".")
              )
        value_df <-
            as.data.frame(lapply(index,
                                 function(x){
                                     sum(day_df[x,2])
                                 }
                          )
           )
        names(value_df) <- projects
    }
    new("Workday",
        topic = names(value_df)
       ,hours = as.vector(as.matrix(value_df[1,]))
       ,date  = as.POSIXct(day, format = "%Y-%m-%d")
       ,subject = subjects
        )
}

