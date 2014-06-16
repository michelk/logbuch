summarizeTU_functions <-  # functions-list to summarize time-units
    list(
         'week' = function(ts.df)
         {
             date_list <-
                 list(
                      'week' =
                    , 'month' = strftime(as.Date(rownames(ts.df)) , format = "%d")
                      )
             # Construct a plot data-frame
             plot.df <-
                 melt(data.frame(Date = strftime(as.Date(rownames(ts.df))
                                               , format = "%A")
                                 , ts.df)
                   , id.vars = 'Date'
                   , variable_name = "Projects"
             )
             names(plot.df)[3] <- "Hours"
             list('ts' = plot.df, 'project' = plot.df)
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
                                            , format = "%V"))
                          , ts.df)
             pt.week.df <-
                t(sapply(levels(pt.df$Date)
                     , function(x) colSums(pt.df[pt.df$Date == x,-1])))
             plot.df.pt <-
                 melt(pt.week.df)
             names(plot.df.pt) <- c("Date", "Projects", "Hours")
             plot.df.pt$Date <- as.factor(plot.df.pt$Date)
            list('ts' = plot.df.ts, 'project' = plot.df.pt)
        }
        , 'year' = function(ts.df)
        {
            ""
            # barplot: (sum(projects), colors = projects) ~ week
            # barplot: sum(day), color = week ~ project
        }
       ### Returns an inhertited class of WorkPeriod
    )
