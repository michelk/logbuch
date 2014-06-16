isWeekend <-
    function                         # ^ Check, if a day is on weekend
(
    d                                   # ^ 'Date'
)
{
    format(d, "%a") %in% c("Sat", "Sun")
}                                       # ^ Bool
