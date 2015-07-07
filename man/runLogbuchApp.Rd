\name{ runLogbuchApp }
\alias{ runLogbuchApp }
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
    run the logbuch server
}
\description{
    
}
\usage{
    runLogbuchApp(app, port 3333, host, project_csv NULL, staff_csv NULL, data_sources NULL, logo_img NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    	\item{app}{either a directory with the application or list with ui and server}
	\item{port 3333}{port to listen to}
	\item{host}{if "127.0.0.1" only visible on localhost}
	\item{project_csv NULL}{filepath to csv with project-data}
	\item{staff_csv NULL}{filepath to csv with staff-data}
	\item{data_sources NULL}{filepaths to data sources to use}
	\item{logo_img NULL}{filepath to logo}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
    
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