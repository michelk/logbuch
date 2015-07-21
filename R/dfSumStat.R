dfSumStat <-
    function         # ^ calculate row and column sums and append them
(
    x                                   # ^ data.frame
)
{
    cs <- cbind(x, Total = rowSums(x, na.rm = TRUE))
    rbind(cs, Total = colSums(cs, na.rm = TRUE))
}                              # ^ data.frame with column and row sums
