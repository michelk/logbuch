readDayFile <-
    function      # ^ Read in a day record file (`.wdlog`)
### ^  contents should look like:
### ^  Date : Monday, 18 October 2011
### ^  08.00 - 10.00  |   <Project>   | <subproject>  | Description
### ^  10.00 - 12.00  |   <Project>   | <subproject2> | Description
(
    x # ^ character; filepath to day record-file with '.wdlog' ending;
   ,subProj = FALSE           # ^ should subprojects be kept seperated
)
{
    COLS <- c("Time", "Proj", "SubProj", "Desc")
    dte <-                # date is defined in file-name et 2014-03-27
        sub(".wdlog", "", basename(x))
    dd. <-
        read.table(
            x, col.names = COLS,
            sep = "|", skip = 1, stringsAsFactors = FALSE)
    if (nrow(dd.) == 0)
        return(NULL)
    dd <-         # remove any whitespace/tab except of desc
        data.frame(do.call(rbind,
                lapply(seq_len(nrow(dd.)), function(i)
                       c(cleanWdLogField(dd.[i,1:3]), strip(dd.[i,4]))
                       )
                ))
    names(dd) <- COLS
    ddh <-                      # points in time converted to durations
       transform(dd, Time = round(tStampToHours(Time), digits = 2))
    dds <-                              # summed up subproject-hours
        sumSubProjects(ddh, "Proj", "SubProj", "Time", "Desc")

    if (subProj)
        dds
    else
    {
        ddp. <-                         # subproject to desc
            transform(dds, Desc = paste(SubProj, "--", Desc), SubProj = NULL)
        ddp <-                       # squash subprojects (old format)
            do.call(rbind,
                    applyOnLevels(
                        ddp., "Proj", function(e)
                    {
                        setNames(
                            data.frame(e[1,"Proj"], sum(e[,"Time"]),
                                       paste(e[,"Desc"], collapse = "; ")),
                            c("Proj", "Time", "Desc"))
                    }
                        ))
        new("Workday",
             topic   = as.character(ddp$Proj)
            ,hours   = as.numeric(ddp$Time)
            ,date    = as.POSIXct(dte, format = "%Y-%m-%d")
            ,subject = as.character(ddp$Desc)
            )
    }
}                                       # ^ 'Workday'

