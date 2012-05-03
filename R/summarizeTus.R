summarizeTus <- 
    function
(
    ts.df          # data-frame with hours per project per day
  , tu             # time-unit (could be 'week', 'month' or  'year)
  , hours_to_work  # hours to work per time-unit
)
{
    if ( ! tu %in% c("week", "month", "year"))  
        stop("Time-unit, tu, has to be from 'week', 'month' or  'year")  
    summarizeTU_functions <-  # functions-list to summarize time-units
        list(
             'week' = function(ts.df) 
             {
                 # Construct a plot data-frame
                 plot.df <- 
                     melt(data.frame(Date = strftime(as.Date(rownames(ts.df)) 
                                                   , format = "%A")
                                     , ts.df)
                       , id.vars = 'Date'
                       , variable_name = "Projects"
                 )
                 names(plot.df)[3] <- "Hours"
                 wp <- 
                     new("WorkPeriod"
                       , from_to = as.character(rownames(ts.df)[c(1, nrow(ts.df))]) 
                       , plot_df = plot.df
                       , hours_to_work = hours_to_work
                         )
                 list('ts' = new("WorkPeriodWeekTs", wp)
                    , 'project' = new("WorkPeriodWeekPt", wp)
                 )
             }
           , 'month' =  function(ts.df) 
            {
                # Generate data-frame for time-series
                 plot.df.ts <- 
                     melt(data.frame(
                             Date = strftime(as.Date(rownames(ts.df)) 
                                        , format = "%d") 
                           , ts.df)
                       , id.vars = 'Date'
                       , variable_name = "Projects"
                 )
                 names(plot.df.ts)[3] <- "Hours"

                 # Gerenate data-frame for projects per week
                 pt.df <- 
                     data.frame(
                                Date = as.factor(strftime(as.Date(rownames(ts.df)) 
                                                , format = "%W"))
                              , ts.df)
                 pt.week.df <- 
                    t(sapply(levels(pt.df$Date)
                         , function(x) colSums(pt.df[pt.df$Date == x,-1])))
                 plot.df.pt <- 
                     melt(pt.week.df)
                 names(plot.df.pt) <- c("Date", "Projects", "Hours")
                 plot.df.pt$Date <- as.factor(plot.df.pt$Date)
                list('ts' = 
                        new('WorkPeriodMonthTs'
                          , from_to = as.character(rownames(ts.df)[c(1, 
                                                                     nrow(ts.df))]) 
                          , plot_df = plot.df.ts
                          , hours_to_work = hours_to_work
                          )
                   , 'project' = 
                        new('WorkPeriodMonthPt'
                          , from_to = as.character(rownames(ts.df)[c(1, 
                                                                     nrow(ts.df))]) 
                          , plot_df = plot.df.pt
                          , hours_to_work = hours_to_work
                          )
                )
            }
            , 'year' = function(ts.df)
            {
                 pt.df <- 
                     data.frame(
                                Date = as.factor(strftime(as.Date(rownames(ts.df)) 
                                                , format = "%W"))
                              , ts.df)
                 pt.week.df <- 
                    t(sapply(levels(pt.df$Date)
                         , function(x) colSums(pt.df[pt.df$Date == x,-1])))
                 plot.df <- 
                     melt(pt.week.df)
                 names(plot.df) <- c("Date", "Projects", "Hours")
                 plot.df$Date <- as.factor(plot.df$Date)
                 wp <- 
                     new("WorkPeriod"
                       , from_to = as.character(rownames(ts.df)[c(1, nrow(ts.df))]) 
                       , plot_df = plot.df
                       , hours_to_work = hours_to_work
                         )
                 list('ts' = new("WorkPeriodYearTs", wp)
                    , 'project' = new("WorkPeriodYearPt", wp)
                 )
            }
    
        )
        summarizeTu <- summarizeTU_functions[[tu]]
        summarizeTu(ts.df) # inherited class of WorkPeriod
        ### Returns an inhertited class of WorkPeriod
}
