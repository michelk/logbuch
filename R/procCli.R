procCli <-
    function       # ^ Process command-line arguments
(
    args           # ^ given command-line arguments
)
{

    if ( identical(args, character(0)) )
    {
        list(
             week = strftime(Sys.Date(), format = "%Y/%m/%V")
           , month = strftime(Sys.Date(), format = "%Y/%m")
           , year = strftime(Sys.Date(), format = "%Y")
             )
    } else
    {
        library('getopt')
        opt_spec <-
            matrix(c(
                     'help',     'h', 0, "logical",   "Getting help"
                   , 'week',     'w', 1, "character", "Directoy of week to summarize"
                   , 'month',    'm', 1, "character", "Directoy of month to summarize"
                   , 'year',     'y', 1, "character", "Directoy of month to summarize"
                     ), ncol = 5, byrow = TRUE)
        opt <- getopt(spec = opt_spec)

        if ( !is.null(opt$help) || is.null(commandArgs()) )
        {
            cat(getopt(spec = opt_spec, usage = TRUE, command = "summarizeWorkHours"))
            q(status=0)
        }
        opt$ARGS <- NULL
        opt            # Alist with command-line arguments
    }
} # ^ Named list with given command-line arguments
