\name{ sumSubProjects }
\alias{ sumSubProjects }
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
    sum hours of subprojects and concat desc
}
\description{
    
}
\usage{
    sumSubProjects(x, projCol, subProjCol, timeCol, descCol NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    	\item{x}{data.frame from wdlog-file}
	\item{projCol}{column with project-names}
	\item{subProjCol}{column with subproject-names}
	\item{timeCol}{column with hours}
	\item{descCol NULL}{column with description}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
    data.frame with summed subprojects
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