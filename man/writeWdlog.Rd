\name{ writeWdlog }
\alias{ writeWdlog }
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
    write data-frame into wdlog-format
}
\description{
    
}
\usage{
    writeWdlog(dd, path, hours, dir_struct, file_struct, col_sep)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    	\item{dd}{data-frame with date, categorie, subject columns}
	\item{path}{root-directory where wdlog-files are located}
	\item{hours}{hours per day to be worked}
	\item{dir_struct}{directory date-format (see ?strptime) eg '2013/12/51'}
	\item{file_struct}{file date-format (see ?strptime) eg '2013-12-05.wdlog'}
	\item{col_sep}{column-seperator in wdlog-file}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
    Nothing useful; files are written to hard-disk
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