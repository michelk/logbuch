lookupProjects <-
    function                         # ^ lookup (sub-) projects number
(
    x                     # ^ data.frame generated with readWdlogFiles
   ,cnf                   # ^ named list with project configuration
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
          if ( nm %in% names(cnf))
          {
            n <- cnf[[nm]]@id
            if (length(cnf[[nm]]@sb) > 0 &&
                sm %in% names(cnf[[nm]]@sb))
              list(n, cnf[[nm]]@sb[[sm]])
            else
              list(n, NA)
          }
          else
            list(NA, NA)
        }
      cbind(r[,1:3],ProjName = r[,4], ProjNb = ns[[1]],
            SubProjNb = ns[[2]], r[,6:ncol(r)] )
    }
    )
  )
}                           # ^ data.frame with lookuped project-names
