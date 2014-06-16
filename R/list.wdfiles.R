list.wdfiles <-
    function       # ^ List workday-log-files
(
    path           # ^ directory-path where to look for workday-log-files
)
{
    tryCatch(list.files(path = path
                      , pattern = "\\.wdlog$"
                      , full.names = TRUE
                      , recursive = TRUE
                      )
        , error = function(e) stop("Could not find any *.wdlog-files"))
} # ^ Returns a vector with path-names of workday-log-files
