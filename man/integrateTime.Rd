\name{ integrateTime }
\alias{ integrateTime }
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
    Integrate a time-series in time
}
\description{
    
}
\usage{
    integrateTime(dd, unit c("day", "week", "month", "year", "total")[2], FUN sum)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    	\item{dd}{data.frame with Date, Person, ProjectName, ProjectNb, ProjectSubNb, Time}
	\item{unit c("day", "week", "month", "year", "total")[2]}{time unit to integrate}
	\item{FUN sum}{function for combination}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
    data.frame with integrated time-unit
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line