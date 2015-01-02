plotAggregatedData <-
    function             # ^ Plot aggregated data with 'integrateTime'
(
    tt                                  # ^ data.frame
)
{
    if (length(grep("-", tt[1,1])) > 0) # day aggregation
        tt <-
        {
            tt <- transform(tt, Date = as.POSIXct(Date))
            ttr <- range(tt$Date)
            alldates <- data.frame(Date = seq(ttr[1], ttr[2], by = "day"))
            tta <-
                merge(tt, alldates, all = TRUE)
            transform(tta, ProjectNb = as.character(ProjectNb))
        }
    {}
    if (length(levels(tt$Date)) ==  1)  # Total viz
    {
        if ((length(levels(factor(tt$ProjectNb))) == 1) && ("ProjectSubNb" %in% names(tt)))
            ggplot(tt, aes(x = ProjectSubNb, y = Time)) +
                geom_bar(stat= "identity", aes(fill = Person))
        else
            ggplot(tt, aes(x = ProjectNb, y = Time)) +
                geom_bar(stat= "identity", aes(fill = Person))
    }
    else if (length(levels(factor(tt$Person))) == 1)
    {
        ggplot(tt, aes(x = Date, y = Time)) +
            geom_bar(stat = "identity", aes(fill = ProjectNb))
    }
    else if ((length(levels(factor(tt$ProjectNb))) == 1) && ("ProjectSubNb" %in% names(tt)))
            ggplot(tt, aes(x = Date, y = Time)) +
                geom_bar(stat= "identity", aes(fill = ProjectSubNb)) +
                    facet_wrap(~Person)
    else
        ggplot(tt, aes(x = Date, y = Time)) +
            geom_bar(stat = "identity", aes(fill = Person)) +
                facet_wrap(~ProjectNb)
}                                       # ^ ggplot
