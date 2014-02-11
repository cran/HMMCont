\name{statesDistributionsPlot}
\alias{statesDistributionsPlot}

\title{
Probability Density Functions of the States
}
\description{
The function plots the Gaussian probability density functions from the means and variances of the whole data set, the two sub-sets corresponding to the two Markov chain states, and additionally from the HMM model (i.e. the means and variances taken form the last Baum-Welch iteration).
}
\usage{
statesDistributionsPlot(hmm, sc = 1)
}

\arguments{
  \item{hmm}{
An object of the class ContObservHMM.
}
  \item{sc}{
Scaling factor used when the initial HMM-object was set.
}
}

\value{
Plot of the probability density functions.
}

\author{
Mikhail A. Beketov
}
\seealso{
Functions: \code{\link{hmmsetcont}},
\code{\link{baumwelchcont}}, and
\code{\link{viterbicont}}.
}
\examples{

Returns<-logreturns(Prices) # Getting a stationary process
Returns<-Returns*10 		# Scaling the values
hmm<-hmmsetcont(Returns) 	# Creating a HMM object
for(i in 1:6){hmm<-baumwelchcont(hmm)} # Baum-Welch is 
# executed 6 times and results are accumulated
hmmcomplete<-viterbicont(hmm) # Viterbi execution

statesDistributionsPlot(hmmcomplete, sc=10) # PDFs of 
# the whole data set and two states are plotted 
}

\keyword{ Baum-Welch }
\keyword{ Viterbi }
