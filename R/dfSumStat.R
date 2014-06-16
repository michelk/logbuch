dfSumStat <-
    function         # ^ calculate row and column sums and append them
(
    x                                   # ^ data.frame
)
{
    cs <- cbind(x, Total = rowSums(x))
    rbind(cs, Total = colSums(cs))
}                              # ^ data.frame with column and row sums
