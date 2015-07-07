\name{ readDayFile }
\alias{ readDayFile }
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
    Read in a day record file (`.wdlog`)
}
\description{
      contents should look like:
  Date : Monday, 18 October 2011
  08.00 - 10.00  |   <Project>   | <subproject>  | Description
  10.00 - 12.00  |   <Project>   | <subproject2> | Description
}
\usage{
    readDayFile(x, subProj FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    	\item{x}{character; filepath to day record-file with '.wdlog' ending;}
	\item{subProj FALSE}{should subprojects be kept seperated}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
    'Workday'
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