sumSubProjects <-
    function                # ^ sum hours of subprojects and concat desc
(
    x                                   # ^ data.frame from wdlog-file
   ,projCol                             # ^ column with project-names
   ,subProjCol                          # ^ column with subproject-names
   ,timeCol                             # ^ column with hours
   ,descCol = NULL                      # ^ column with description
)
{
    do.call(rbind,
    applyOnLevels(
        x, projCol, function(e)
        do.call(rbind,
                applyOnLevels(
                    e, subProjCol, function(g)
                {
                    tdf <-              # project and time data
                        setNames(
                            data.frame(
                                g[1,projCol], g[1,subProjCol],
                                sum(g[,timeCol])
                                ),
                            c(projCol, subProjCol, timeCol))
                    if (!is.null(descCol))
                    {
                        ddf <-
                            cbind(tdf, paste(g[,descCol], collapse = ", "))
                        names(ddf)[4] <- descCol
                        ddf
                    }
                    else
                        tdf
                }
                    )
                )
        ))
}                               # ^ data.frame with summed subprojects
