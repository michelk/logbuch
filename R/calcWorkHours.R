calcWorkHours <- # Calculate hours per week and topic for a given workdays-list
    function
(
    wd_list        # slot wd of an object of class "workdays"
)
{
     week_topics <- 
         levels(as.factor(unlist(sapply(wd_list@wd, function(x){x@topic}))))
     workweek_df <- data.frame(topics = week_topics, hours = 0) 
     sapply(wd_list@wd, 
            function(x){
                for ( i in seq(along = x@topic) ) {
                    index <- which(workweek_df$topics == x@topic[i])
                    workweek_df$hours[index] <<- 
                        workweek_df$hours[index] + x@hours[i]
                }
            })
     
     new("Workweek", topics = week_topics, 
         hours = workweek_df[,2]
         )
     ### Returns and object of class "workweek" 
}

