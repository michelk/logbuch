cleanWdLogField <-
    function                      # ^ remove any whitespace or tab
(
    x                     # ^ character: a field of day-record-file
    )
{
    gsub(
        "\t+", "", gsub("\\s+", "", x))
}                                  # ^ returns a cleaned character
