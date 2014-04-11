dfSumStat <-
    function(x)        # calculate row and column sums and append them
{
    cs <- cbind(x, Total = rowSums(x))
    rbind(cs, Total = colSums(cs))
}
