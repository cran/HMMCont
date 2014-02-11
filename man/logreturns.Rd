\name{logreturns}
\alias{logreturns}

\title{
Calculating Log-returns
}
\description{
Simple function that calculates log-returns from prices time series.
}
\usage{
logreturns(x)
}

\arguments{
  \item{x}{
Vector of prices or an index values (class "numeric").
}
}

\value{
Vector of log-returns (class "numeric").
}

\author{
Mikhail A. Beketov
}
\seealso{
Functions: \code{\link{hmmsetcont}},
\code{\link{baumwelchcont}}, 
\code{\link{viterbicont}}, and
\code{\link{statesDistributionsPlot}}.
}
\examples{

Returns<-logreturns(Prices)
par(mfrow=c(2,1))
plot(Prices, type="l") 
plot(Returns, type="l")
}

\keyword{ Returns }
\keyword{ Econometrics }
