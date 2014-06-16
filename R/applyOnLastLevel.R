applyOnSecondLevel <-
    function             # ^ go over levels and apply certain function
(
    x         # ^ data.frame
   ,valueCol  # ^ column with values to apply function to (length = 2)
   ,levelCols # ^ column names to go over levels
   ,FUN       # ^ function to apply to last levels
)
{
    applyOnLevels(
        x, levelCols[1],
        function(e)
    {
        applyOnLevels(
            e, levelCols[2], function(g)
            FUN(g[,valueCol])
            )
    }
        )
}                                 # ^ data.frame with applied function
