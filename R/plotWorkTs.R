plotWorkTs <-
    function       # ^ Plot a work-week data-frame
(
    plot.df        # ^ data-frame with date as row-name and project as columns
  , what = 'ts'    # ^ which aspect to plot; could be either 'ts' or 'project'
  , hours          # ^ hours to work per time unit
        = NULL
  , title_date     # ^ date-string which should appear in the title
)
{
     if (! what %in% c('ts', 'project') )
         stop("Only 'ts' or 'project' in `what` allowed")


     plot_data <-  # data to plot for a timeseries (ts) or projects
         list(
              'ts' = function(x) ggplot(x , aes(x = Date, y = Hours, fill = Projects))
            , 'project' = function(x) ggplot(x , aes(x = Projects, y = Hours, fill = Date))
         )
     plot_data[[what]](plot.df)  +
        geom_bar(stat = "identity") +
        geom_hline(yintercept = hours) +
        ggtitle(
             paste(title_date
             , "      Total Workhours: ", sum(plot.df$Hours)
             )
        )
}   # ^ Returns a list of length 2 with a time-series and project plot
