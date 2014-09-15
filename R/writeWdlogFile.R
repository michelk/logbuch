writeWdlog <-
    function                    # ^ write data-frame into wdlog-format
(
    dd            # ^ data-frame with date, categorie, subject columns
   ,path          # ^ root-directory where wdlog-files are located
   ,hours         # ^ hours per day to be worked
   ,dir_struct =  # ^ directory date-format (see ?strptime) eg '2013/12/51'
    "%Y/%m/%V"
   ,file_struct = # ^ file date-format (see ?strptime) eg '2013-12-05.wdlog'
    "%F.wdlog"
   ,col_sep =     # ^ column-seperator in wdlog-file
    " | "
)
{
    unlines <- function(x) paste(c(x, ""), collapse = "\n")
    askForAction <-
        function(wd_lines,wd_file)              # respond to user-interaction
        {
            cat("What should be done?\n\treplace (r), append (a), skip (Enter) \n")
            action = readLines(file('stdin'), n=1)
            if (action == "")
                return(invisible(NULL))
            else if (! action %in% c("r","a") )
                askForAction(wd_lines, wd_file)
            else
                switch(
                    action
                    ,"r" = cat(unlines(wd_lines), file = wd_file)
                    ,"a" = cat(wd_lines[2], "\n", file = wd_file, append = TRUE)
                    )
        }
    for (i in seq_len(nrow(dd)))
    {
        d <- dd[i,1]
        dir <- format(d, dir_struct)
        wd_file <- file.path(dir, format(d, file_struct))
        wd_header <- wdlogHeader(d)
        end_time <-
            format(as.POSIXct("2000-01-01 00:00:00") + (hours * 3600), "%H.%M")
        time <- paste("00.00", end_time, sep = " - ")
        wd_line <-
            paste(time, as.character(dd[i,2]), "", as.character(dd[i,3]), sep = col_sep)
        wd_lines = c(wd_header, wd_line)
        if (!file.exists(wd_file))
        {
            dir.create(dir, recursive = TRUE, showWarnings = FALSE)
            cat(unlines(wd_lines), file = wd_file)
        } else
        {
            cat("There is an existing wdlog-file\n")
            cat(paste("\t\t", readLines(wd_file), collapse= "\n"))
            cat("\n\n")
            askForAction(wd_lines, wd_file)
        }
    }
}           # ^ Nothing useful; files are written to hard-disk
