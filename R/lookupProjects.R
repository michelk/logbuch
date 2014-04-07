lookupProjects <-
    function                            # lookup (sub-) projects number
(
    x                     # ^ data.frame generated with readWdlogFiles
   ,projConf              # ^ named list with
)
{
        do.call(
            rbind,
            lapply(
                seq_len(nrow(x))
                , function(i)
            {
                r <- x[i,]
                nm <- as.character(r[,4])
                sm <- as.character(r[,5])
                ns <-          # project-and subproject number
                {
                    if ( nm %in% names(projConf))
                    {
                        n <-
                        {
                            if (is.numeric(projConf[[nm]]))
                                projConf[[nm]]
                            else
                                projConf[[nm]]$nb
                        }
                        if (is.list(projConf[[nm]]) && sm %in% names(projConf[[nm]]$sb))
                            list(n, projConf[[nm]]$sb[[sm]])
                        else
                            list(n, NA)
                    }
                    else
                        list(NA, NA)
                }
                cbind(r[,1:3],ProjName = r[,5], ProjNb = ns[[1]],
                      SubProjNb = ns[[2]], r[,6:ncol(r)] )
            }
                        )
            )
}
