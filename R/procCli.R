procCli <- 
    function       # Process command-line arguments
(
    args           # given command-line arguments
)
{

    library('getopt')
    opt_spec <- 
        matrix(c(
                 'help',     'h', 0, "logical",     "Getting help"
               , 'week',     'w', 0, "character", "Directoy of week to summarize"
               , 'month',     'm', 0, "character", "Directoy of month to summarize"
               , 'year',     'y', 0, "character", "Directoy of month to summarize"
                 ), ncol = 5, byrow = TRUE)
    opt <- getopt(spec = opt_spec)

    if ( !is.null(opt$help) || is.null(commandArgs()) )   {    
        cat(getopt(spec = opt_spec, usage = TRUE, command = "summarizeWorkHours"))
        q(status=0)
    }
    if ( all(sapply(opt, function(x) is.null(x))) ) {  
        opt <- 
            list(
                 week = strftime(Sys.Date(), format = "%Y/%m/%W")
               , month = strftime(Sys.Date(), format = "%Y/%m")
               , year = strftime(Sys.Date(), format = "%Y")
                 )
    }
    opt            # Alist with command-line arguments
    ### Returns a named list with given command-line arguments
}
