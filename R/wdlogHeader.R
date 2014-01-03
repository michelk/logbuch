wdlogHeader <-
    function                  # ^ create a header-line for wdlog-files
(
    d                                   # ^ date object
)
{
    format(d, "Date : %A %d %B %Y")     # ^ Returns a string
}
