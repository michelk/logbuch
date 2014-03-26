strip <-
    function(s)           # remove leading and trailing whitespace
{
    as.character(sapply(s, function(x)
                        gsub("^\\s+", "", gsub("\\s+$", "", x))))
}
