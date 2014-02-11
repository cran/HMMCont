\name{viterbicont}
\alias{viterbicont}

\title{
Viterbi Algorithm
}
\description{
The function performs Viterbi algorithm (Viterbi, 1967). It can be applied to a ContObservHMM object after sufficient number of Baum-welch iterations (function \code{baumwelchcont}).
}
\usage{
viterbicont(hmm)
}

\arguments{
  \item{hmm}{
An object of the class ContObservHMM.
}
}

\value{
An object of the class ContObservHMM (see section on the function \code{hmmsetcont}). The object can be analysed with the class-specific functions \code{print}, \code{summary}, and \code{plot}.
}
\references{
Viterbi, A.J. 1967. Error bounds for convolutional codes and an asymptotically optimum decoding algorithm. IEEE Transactions on Information Theory. 13: 260-269.
}
\author{
Mikhail A. Beketov
}
\seealso{
Functions: \code{\link{hmmsetcont}}, 
\code{\link{baumwelchcont}}, and
\code{\link{statesDistributionsPlot}}.
}
\examples{

Returns<-logreturns(Prices) # Getting a stationary process
Returns<-Returns*10 		# Scaling the values
hmm<-hmmsetcont(Returns) 	# Creating a HMM object
for(i in 1:6){hmm<-baumwelchcont(hmm)} # Baum-Welch is 
# executed 6 times and results are accumulated

hmmcomplete<-viterbicont(hmm) # Viterbi execution

par(mfrow=c(2,1))
plot(hmmcomplete, Prices, ylabel="Price") 
plot(hmmcomplete, ylabel="Returns") # the revealed 
# Markov chain and the observations are plotted
}

\keyword{ Viterbi }
\keyword{ Hidden Markov Model }
