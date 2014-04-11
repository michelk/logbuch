writeXlsx <-
    function(sheets, file)        # wrapper function to write custom xlsx
{
    writeXlsx. <- function(x,f,nm, append)
        write.xlsx(x, file = f,
            sheetName = nm, row.names = FALSE, showNA = FALSE, append = append)
    nms <- names(sheets)
    writeXlsx.(sheets[[1]], file, nms[1], append = FALSE)
    for (nm in nms[-1])
    {
        writeXlsx.(sheets[[nm]], file, nm, append = TRUE)
    }

}
