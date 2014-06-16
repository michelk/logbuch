strip <-
    function                  # ' Remove leading and trailing whitespace
(
    s                                   # ^ String
)
{
    as.character(sapply(s, function(x)
                        gsub("^\\s+", "", gsub("\\s+$", "", x))))
}                  # ^ String without leading and trailing whitespace
