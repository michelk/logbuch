wdlogHeader <-
    function                  # ^ Create a header-line for wdlog-files
(
    d                                   # ^ Date object
)
{
    format(d, "Date : %A %d %B %Y")
}                                       # ^ Header string
