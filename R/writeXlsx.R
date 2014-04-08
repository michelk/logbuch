writeXlsx <-
    function(x, file, colSheets)        # wrapper function to write custom xlsx
{
    writeXlsx. <- function(x,f,nm, append)
        write.xlsx(x[xs == nm,], file = f,
            sheetName = nm, row.names = FALSE, showNA = FALSE, append = append)
    xs <- x[,colSheets]                 # x subset
    mns <- levels(factor(xs))
    writeXlsx.(x, file, mns[1], append = FALSE)
    for (m in mns[-1])
    {
        writeXlsx.(x, file, m, append = TRUE)
    }

}
